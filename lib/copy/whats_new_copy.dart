import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';

class WhatsNewCopy{

  static String getLatestVersionCopy(){
    return
        "### Version 1.3.0 \n"
        "\n"

        "* Improved options to clear collection \n"
        "* Added link to review app in sidebar\n"
        "* Added the option to remove ads\n"
        "* (see full details in version history)\n\n"
        "${getFooter()}";
  }

  static String getFooter(){
    return "\n\n"
        " --- \n\n"
        "MP Checklist is free, but relies on ads and donations - if you find the app useful, please consider making a donation to remove ads.\n\n"
        "Thank you.";
  }


  static Widget getVersionHistory(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Markdown(
          physics: ClampingScrollPhysics(),
            data:
            "### Version 1.3.0 \n"
                "\n"

                "* Improved options to clear collection \n"
                "* Added link to review app in sidebar\n"
                "* Added the option to remove ads\n\n"
                " --- \n\n "
            "### Version 1.2.1 \n"
                "\n"


                "* Makes notes to help find items\n"
                "* Search by map location to list items\n"
                "\n\n"

            "### Version 1.0 \n"
                "\n"

                "* Track Item collection by game region or item type\n"



        ),
      ),
    );
  }
}