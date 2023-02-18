import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/theme/theme_constants.dart';
import 'package:metroid_prime_items/ui/MetroidHome.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'helper/item_generator.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ItemsAdapter());
  await Hive.openBox<Items>("ItemBox");

  if(Hive.box<Items>("ItemBox").isEmpty){
    ItemGenerator.generateItems();
  }

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MP Checklist',

    theme: lightTheme ,
    darkTheme: darkTheme,
    themeMode: ThemeMode.system,


    home:  MetroidHome(),
  ));
}

