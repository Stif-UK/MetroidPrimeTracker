import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class MetroidPreferences {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  //Instance variables
  static const _keyOpenCount = 'openCount';
  static const _keyAppPurchased = 'appPurchased';
  static const _keyAppReviewPrompt = 'appReviewPrompt';


  //Getters and setters

//Getter and setter for app open count int
  static int? getOpenCount() => _preferences.getInt(_keyOpenCount);

  static Future setOpenCount(int openCount) async =>
      await _preferences.setInt(_keyOpenCount, openCount);

  //Getter and setter for purchased bool
  static bool? getAppPurchasedStatus() => _preferences.getBool(_keyAppPurchased);

  static Future setAppPurchasedStatus(bool appPurchased) async =>
      await _preferences.setBool(_keyAppPurchased, appPurchased);

  static bool? getAppReviewPrompted() => _preferences.getBool(_keyAppReviewPrompt);

  static Future setAppReviewPrommpted(bool appReviewPrompted) async =>
      await _preferences.setBool(_keyAppReviewPrompt, appReviewPrompted);

}