import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/theme/theme_constants.dart';
import 'package:metroid_prime_items/ui/MetroidHome.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ItemsAdapter());
  await Hive.openBox<Items>("ItemBox");

  // if(Hive.box("ItemBox").isEmpty){
  //   ItemHelper.generateItems();
  // }

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Metroid Prime Item Tracker',

    theme: lightTheme ,
    darkTheme: darkTheme,
    themeMode: ThemeMode.system,
    //ThemeMode.light,
    //ThemeMode.system,

    home:  MetroidHome(),
  ));
}

