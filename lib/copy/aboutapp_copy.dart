import 'package:flutter/material.dart';

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

  static Widget getAcknowledgementCopy(){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: const [
          Text("This application is build with the use of the following libraries and services:",
          style: TextStyle(fontWeight: FontWeight.bold),),
          Divider(thickness: 2),
          Text("GetX has been used for state management and page routing. "
              "\nAvailable at pub.dev/packages/get \n"
              "Distributed under the MIT Licence."),
          Divider(thickness: 2),
          Text("Hive has been utilised to provide the database underpinning the application."
              "\nAvailable at pub.dev/packages/hive \n"
              "Distributed under the Apache 2.0 Licence."),
          Divider(thickness: 2),
          Text("Jiffy has been used to perform date based calculations."
              "\nAvailable at pub.dev/packages/jiffy \n"
              "Distributed under the MIT Licence."),
          Divider(thickness: 2),
          Text("Syncfusion Charts have been used to draw charts."
              "\nAvailable at pub.dev/packages/syncfusion_flutter_charts \n"
              "Distributed and used under the Syncfusion Community Licence."),
          Divider(thickness: 2),
          Text("Image_Cropper library has been used to allow cropping images uploaded to the app"
              "\nAvailable at pub.dev/packages/image_cropper  \n"
              "Distributed under the BSD-3-clause licence."),
          Divider(thickness: 2),
          Text("App Icons were generated for all platforms with the help of easyappicon.com"
              "\nUsing assets created by Umar Irshad available from iconfinder.com"),
          Divider(thickness: 2),
          Text("With thanks to the users and contributors of the Christopher Ward Forum."
              "\nTheir input and support was invaluable to the development of this application.",
            style: TextStyle(fontWeight: FontWeight.bold),),
          Divider(thickness: 2)
        ],
      ),
    );


  }
}

