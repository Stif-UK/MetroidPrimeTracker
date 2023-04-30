import 'dart:io' show Platform;

class MPKeysDemo{
  static String getRevenueCatKey(){
    return Platform.isAndroid? "" : "";
  }
}