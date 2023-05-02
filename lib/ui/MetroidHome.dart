import 'package:flutter/material.dart';
import 'package:metroid_prime_items/api/purchase_api.dart';
import 'package:metroid_prime_items/helper/startup_helper.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:metroid_prime_items/ui/ItemTypeUI.dart';
import 'package:metroid_prime_items/ui/search.dart';
import 'RegionsUI.dart';
import 'navbar.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'dart:io' show Platform;


class MetroidHome extends StatefulWidget {
  const MetroidHome({Key? key}) : super(key: key);

  @override
  State<MetroidHome> createState() => _MetroidHomeState();
}

class _MetroidHomeState extends State<MetroidHome> {
  var _showRegions = true;


  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      AppTrackingTransparency.requestTrackingAuthorization();
    }

    //Set first opened date on first app open
    if(MetroidPreferences.getFirstUseDate() == null){
      MetroidPreferences.setFirstUseDate(DateTime.now());
    }

    //If app is pro, check entitlement is still valid - check once per week
    if(MetroidPreferences.getAppPurchasedStatus() == true){
      final lastChecked = MetroidPreferences.getLastEntitlementCheckDate();
      if(lastChecked == null){
        PurchaseApi.checkEntitlements();
      } else {
        final date2 = DateTime.now();
        final difference = date2.difference(lastChecked).inDays;
        if(difference > 6){
          PurchaseApi.checkEntitlements();
        }
      }

    }

    StartupHelper.runStartupCheck(context);

    return Scaffold(
      appBar: AppBar(
        title: _showRegions? const Text("Tallon Regions"): const Text("Item Types"),
        actions: [
          IconButton(
              icon: _showRegions? const Icon(Icons.dataset_outlined): const Icon(Icons.map),
          onPressed: (){
                setState(() {
                  _showRegions = !_showRegions;
                });
          },),

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
              showSearch(
                  context: context,
                  delegate: SearchWidget());
            },
          )
        ],
      ),
      drawer: NavBar(),
      body: _showRegions? RegionsUI(): ItemsTypeUI(),
    );
  }
}

