import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class MetroidPreferences {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  //Instance variables
  static const _keyOpenCount = 'openCount';


  //Getters and setters

//Getter and setter for app open count int
  static int? getOpenCount() => _preferences.getInt(_keyOpenCount);

  static Future setOpenCount(int openCount) async =>
      await _preferences.setInt(_keyOpenCount, openCount);

}