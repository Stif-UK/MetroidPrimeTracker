import 'package:metroid_prime_items/errors/error_handling.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MetroidController extends GetxController{

  //Manage app purchase status
  final isAppPro = MetroidPreferences.getAppPurchasedStatus()!.obs;

  //Calling updateAppPurchaseStatus triggers a call to the Purchases package which will update the app status
  //based on whether the user holds the MP Checklist Pro entitlement.
  updateAppPurchaseStatus() async {
    bool? isPro = false;
    try {
      print("Trying to check purchase status");
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      isPro = customerInfo.entitlements.all["MP Checklist Pro"]?.isActive ;
      print("Entitlement checked value: $isPro");
    } on PlatformException catch (e) {
      MetroidErrorHandling.surfacePlatformError(e);
    }
    isAppPro(isPro);
    await MetroidPreferences.setAppPurchasedStatus(isPro!);
  }

  revertPurchaseStatus() async{
    isAppPro(false);
    await MetroidPreferences.setAppPurchasedStatus(false);

  }
}