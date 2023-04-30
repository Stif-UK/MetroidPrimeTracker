import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/api/keys.dart';
import 'package:metroid_prime_items/controller/metroid_controller.dart';
import 'package:metroid_prime_items/errors/error_handling.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi{
  static final _apiKey = MPKeys.getRevenueCatKey();
  final metroidController = Get.put(MetroidController());

  static Future init() async {
    await Purchases.setLogLevel(LogLevel.debug);
    PurchasesConfiguration configuration = PurchasesConfiguration(_apiKey);
    //Removing boilerplate - the platform check is done in the keys file.
    // if (Platform.isAndroid) {
    //   configuration = PurchasesConfiguration(_apiKey);
    // } else if (Platform.isIOS) {
    //   configuration = PurchasesConfiguration(_apiKey);
    // }
    await Purchases.configure(configuration);
  }

  static Future<List<Offering>> fetchOffers() async{
    try{
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      return current == null? [] : [current];
    } on PlatformException catch (e) {
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      showSuccessDialog();
      return true;
    } catch (e) {
      if(e is PlatformException) {
        MetroidErrorHandling.handlePurchaseError(e);
      }
      return false;
    }
  }

  static Future<String> getAppPurchaseDate(bool first) async {
    String returnString = "Not Found";
    if (MetroidPreferences.getAppPurchasedStatus() ?? false) {
      try {
        CustomerInfo customerInfo = await Purchases.getCustomerInfo();
        returnString = first? customerInfo.allPurchaseDates.values.last.toString(): customerInfo.allPurchaseDates.values.first.toString() ;
      } on PlatformException catch (e) {
        MetroidErrorHandling.surfacePlatformError(e);
      }
    }
    return returnString;
  }

  static Future<bool> restorePurchases() async {
    bool? restoreSuccess = false;
    try {
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      restoreSuccess = customerInfo.entitlements.all["MP Checklist Pro"]?.isActive ;
    } on PlatformException catch (e) {
      MetroidErrorHandling.handlePurchaseError(e);
    }
    return restoreSuccess ?? false;
  }

  //checkEntitlements should only be called for a user that holds a pro app - its purpose is to validate that the pro sub is still valid
  static checkEntitlements() async {
    bool? entitlementValid = true;

    try {
      print("Getting customer info");
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      print("Checking entitlement is valid");
      entitlementValid = customerInfo.entitlements.all["MP Checklist Pro"]?.isActive ;
      print("Status: $entitlementValid");
      MetroidPreferences.setLastEntitlementCheckDate(DateTime.now());
    } on PlatformException catch (e) {
      //AirFryrErrorHandling.handlePurchaseError(e);
    }
    //If the entitlement check shows the entitlement is not valid, remove pro status
    if(!(entitlementValid ?? true)){
      final metroidController = Get.put(MetroidController());
      metroidController.revertPurchaseStatus();

    }
  }

  static getAppUserID() async{
    String returnString = "N/A";
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      if(customerInfo != null){
        returnString = customerInfo.originalAppUserId;
      }

    } on PlatformException catch (e) {
      //AirFryrErrorHandling.handlePurchaseError(e);
    }
    return returnString;
  }

  static showSuccessDialog(){
    Get.defaultDialog(
        title: "Payment Successful",
        middleText: "Thank you for supporting MP Checklist!\n"
            "Your contribution helps me to keep the app going and is really appreciated.\n\n"
            "Got any feedback or ideas for improvement? Please leave an app review or drop me an email!"

    );
  }
}