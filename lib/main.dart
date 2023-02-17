import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/theme/theme_constants.dart';
import 'package:metroid_prime_items/ui/MetroidHome.dart';

void main() {
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

