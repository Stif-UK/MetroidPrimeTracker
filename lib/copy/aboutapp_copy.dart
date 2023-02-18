import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';

class AboutAppCopy{


  static Widget getAttributionFontAwesome(){
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("This app makes use of FontAwesome, using the font_awesome_flutter library. More information is available at fontawesome.com"
          ),
    );
  }

  static Widget getAttributionHive(){
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("Hive has been utilised to provide the database underpinning the application."
          "\nAvailable at pub.dev/packages/hive \n"
          "Distributed under the Apache 2.0 Licence."
      ),
    );
  }

  static Widget getAttributionGetX(){
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("GetX has been used for state management and page routing. "
          "\nAvailable at pub.dev/packages/get \n"
          "Distributed under the MIT Licence."),
    );
  }

  static Widget getAboutDeveloperCopy(){
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("Who or what is a StifDEV? \n"
          "\nStifDEV is simply the name I use to release my applications, essentially a 'nom de plume'. There's a long, and not very interesting, story behind the name,"
          "but in short I'm just a guy who likes to play around with code in my spare time.\n"
          "\nWith a busy full time job and young children my time to do so is limited, but hopefully I've managed to build an application that others will get some value from - if you do like the app, please consider leaving a review to let me know!"
      ),
    );
  }

  static Widget getResetAllCopy(){
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("Press the button below to reset all data to 0% completion \n\nThis cannot be undone!",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20,),
    ));
  }

  static getResetAllDialog(BuildContext context){
    Get.defaultDialog(
      title: "Reset All Data",
      middleText: "Are you Sure? Data will reset to 0% completion.",
      textConfirm: "Yes",
      textCancel: "No Thanks",
      confirmTextColor: Colors.white,
      buttonColor: Colors.lightBlueAccent,
      onConfirm: () {
        print("calling reset all from dialog");
        ItemHelper.resetAllData();
        Get.back();
      },
      onCancel: () => Get.back(),

    );

  }

}

