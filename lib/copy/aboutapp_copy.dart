import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/copy/whats_new_copy.dart';
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

  static Widget getAboutAppCopy(){
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("This app lists all of the items that can be collected in Metroid Prime, and is designed as a companion as you play to help you check them off as you work towards 100% item collection.\n\n"
          "The view can be changed to show either items and completion by region (the world of Tallon IV is split into five distinct areas in the game), or by item type by clicking the icon in the top right of the main page.nn"
          "\n\n"
          "Metroid Prime has long been one of my absolute favourite games, so I built this app to help me get to 100% completion as I play through the fantastic remastered version - I hope you find it useful too!\n\n"
          "If you do enjoy the app, please consider leaving a rating or review on the app store.\n\n"
          "Thank you."

      ),
    );
  }

  static Widget getResetAllCopy(){
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("The buttons below allow all collection to be reset to 0% and (separately) all notes to be cleared. \n\nThis cannot be undone!",
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
      //onCancel: () => Get.back(),
    );
  }

  static getResetNotesDialog(BuildContext context){
    Get.defaultDialog(
      title: "Reset All Notes",
      middleText: "Are you Sure? This will clear all notes and cannot be undone.",
      textConfirm: "Yes",
      textCancel: "No Thanks",
      confirmTextColor: Colors.white,
      buttonColor: Colors.lightBlueAccent,
      onConfirm: () {
        ItemHelper.resetAllNotes();
        Get.back();
      },
      //onCancel: () => Get.back(),
    );
  }

  static getWhatsNewDialog(BuildContext context){
    Get.defaultDialog(
        title: "What's New?",
        content: SizedBox(
            width: (MediaQuery.of(context).size.width)*0.7,
            height:(MediaQuery.of(context).size.width)*0.65,
            child: Markdown(data: WhatsNewCopy.getLatestVersionCopy(),))
    );
  }

}

