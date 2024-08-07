import 'package:flutter/material.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';

class RemoveAdsCopy{

  static getPageTitle(){
    return Text("Remove Ads");
  }

  static getPageTitleSupporter(){
    return Text("Support MP Checklist");
  }

  static getRemoveAdsMainCopy(BuildContext context){
    return ItemHelper.isPrimeCollectionComplete()?
        //If the user has collected 100% items, change page copy
    Text(
      "Congratulations on reaching 100% completion of Metroid Prime!\n\n"
      "I build little apps for fun, and provide them completely free, with ads displayed to help me cover the development fees."
          "\n\nHowever, for a niche app these generate only a very small amount, and to keep MP Checklist alive I need to make regular updates which take time and effort.\n\n"
          "If you found the app useful in your adventure, please consider making a small donation to  help me keep it alive - thank you!"
          ,
      style: Theme.of(context).textTheme.bodyLarge,)
        : Text(
      "I build little apps for fun, and provide them completely free, with ads displayed to help me cover the development fees."
          "\n\nHowever if you would like to support the app development and remove ads, you can click below to see in-app purchase "
          "options."
          "\n\nPaying doesn't unlock any additional functionality (everything is free!) it simply removes ads and hopefully gives you a warm feeling that you're"
          " supporting someone that finds their fun creating little apps that others can (hopefully) enjoy!",
    style: Theme.of(context).textTheme.bodyLarge,);
  }

  static getSupporterMainCopy(BuildContext context){
    return Text(
      "Thank you for supporting MP Checklist!\n\n"
          "Your support means a lot and makes it possible for me to continue to develop MP Checklist and other apps like it.\n\n"
          "If you're enjoying the app please consider telling your friends about it or leave a review to let me know what you like about the app and what else you'd like to see added to it!\n\n"
          "If you'd like to continue to support MP Checklist additional donations can be made at any time.",
      style: Theme.of(context).textTheme.bodyLarge,);
  }



  static getButtonLabel(){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text("Show Payment Options"),
    );
  }

  static getButtonLabelSupporter(){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text("Donate Again"),
    );
  }
}