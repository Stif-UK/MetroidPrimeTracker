import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/api/purchase_api.dart';
import 'package:metroid_prime_items/controller/metroid_controller.dart';
import 'package:metroid_prime_items/copy/remove_ads_copy.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:metroid_prime_items/ui/widgets/paywall_widget.dart';

class RemoveAds extends StatefulWidget {
  RemoveAds({Key? key}) : super(key: key);
  final metroidController = Get.put(MetroidController());

  @override
  State<RemoveAds> createState() => _RemoveAdsState();
}

class _RemoveAdsState extends State<RemoveAds> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
          appBar: AppBar(
            title: widget.metroidController.isAppPro.value || ItemHelper.isPrimeCollectionComplete()? RemoveAdsCopy.getPageTitleSupporter() :RemoveAdsCopy.getPageTitle(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: widget.metroidController.isAppPro.value? RemoveAdsCopy.getSupporterMainCopy(context) : RemoveAdsCopy.getRemoveAdsMainCopy(context)),
                    ),
                    const Divider(thickness: 2,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 40, 8, 40),
                      child: OutlinedButton(
                          onPressed:(){
                            fetchOffers();
                          },

                          child: widget.metroidController.isAppPro.value? RemoveAdsCopy.getButtonLabelSupporter() : RemoveAdsCopy.getButtonLabel()),
                    )

                  ],
                ),
                const Divider(thickness: 2,),
                //If the app is not pro, then show 'restore purchase' button.
                widget.metroidController.isAppPro.value? SizedBox(height: 0,) :
                TextButton(onPressed: () async {
                  if(await PurchaseApi.restorePurchases()){
                    //purchase is restored
                    widget.metroidController.updateAppPurchaseStatus();
                    Get.defaultDialog(
                      title: "Purchase Restored",
                      middleText: "You're now ad free!",
                    );
                  } else {
                    //purchase restore failed
                    Get.defaultDialog(
                      title: "Restore Failed",
                      middleText: "No previous or active purchase found for user",
                    );
                  }

                }, child: Text("Restore Purchase Status"))
              ],
            ),
          )
      ),
    );
  }

  Future fetchOffers() async {
    final offerings = await PurchaseApi.fetchOffers();

    if(offerings.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Options Found, try again later")));
    } else {
      final packages = offerings
          .map((offer) => offer.availablePackages)
          .expand((pair) => pair)
          .toList();

      showModalBottomSheet(
          context: context,
          builder: (context) => PaywallWidget(
              packages: packages,
              title: "Support MP Checklist",
              description: "Pay what you like! Choose any option to remove ads",
              onClickedPackage: (package) async{
                //Pop context first - this will allow any exception dialog to show without being blocked by the bottom sheet.
                Navigator.pop(context);
                bool success = await PurchaseApi.purchasePackage(package);
                if (success) {
                  var metroidController = Get.put(MetroidController());
                  metroidController.updateAppPurchaseStatus();
                }


              }
          )
      );


    }


  }

}
