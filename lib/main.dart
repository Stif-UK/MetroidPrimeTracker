import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/api/purchase_api.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:metroid_prime_items/ui/MetroidHome.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:metroid_prime_items/ui/first_use_demo/onboarding.dart';
import 'package:metroid_prime_items/ui/initialise_screen.dart';
import 'package:provider/provider.dart';
import 'provider/adstate.dart';
import 'package:json_theme/json_theme.dart';

import 'helper/item_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  //Initialise RevenueCat
  await PurchaseApi.init();

  await Hive.initFlutter();

  Hive.registerAdapter(ItemsAdapter());
  await Hive.openBox<Items>("ItemBox");

  //Get SharedPreferences
  await MetroidPreferences.init();

  //Load the theme from assets
  final themeStrDark = await rootBundle.loadString('assets/theme/mp_dark_theme.json');
  final themeJsonDark = jsonDecode(themeStrDark);
  final themeDark = ThemeDecoder.decodeThemeData(themeJsonDark);

  final themeStrLight = await rootBundle.loadString('assets/theme/mp_theme.json');
  final themeJsonLight = jsonDecode(themeStrLight);
  final themeLight = ThemeDecoder.decodeThemeData(themeJsonLight);

  //TODO: Move box population into loading widget
  if(Hive.box<Items>("ItemBox").isEmpty){
    ItemGenerator.generateItems();
  }

  //Ensure app purchase status is instantiated in preferences
  if(MetroidPreferences.getAppPurchasedStatus() == null){
    MetroidPreferences.setAppPurchasedStatus(false);
  }

  //Track app open count
  MetroidPreferences.getOpenCount() == null?
    MetroidPreferences.setOpenCount(1):
      MetroidPreferences.setOpenCount(MetroidPreferences.getOpenCount()! + 1);

  //Check if user has seen the first use demo
  final hasSeenDemo = MetroidPreferences.getHasSeenDemo() ?? false;

  runApp(
      Provider.value(
        value: adState,
    builder: (context, child) =>  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MP Checklist',

      theme: themeLight ,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,


      home: hasSeenDemo? InitialiseScreen(targetWidget: MetroidHome()) : const MetroidOnboarding(),
    ),
  ));
}

