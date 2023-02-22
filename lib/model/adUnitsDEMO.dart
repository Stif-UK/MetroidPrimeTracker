import 'dart:io';
/*
Class AdUnits is added to gitIgnore to keep ad unit ids secure - AdUnitsDEMO has been created
and saved to the GitHub repo as an example of content required - this file contains only TEST AD UNITS.
On cloning the app repo, this file can be copied and renamed to 'adunits.dart' with class name 'AdUnits'
 */
class AdUnitsDEMO{
  //methods to return production ad units
  static String get regionPageBannerAdUnitId => Platform.isAndroid
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-3940256099942544/2934735716";



}