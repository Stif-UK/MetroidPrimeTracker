import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/api/purchase_api.dart';
import 'package:metroid_prime_items/controller/metroid_controller.dart';
import 'package:metroid_prime_items/copy/aboutapp_copy.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:metroid_prime_items/helper/text_helper.dart';
import 'package:metroid_prime_items/ui/first_use_demo/onboarding.dart';


class DeveloperStats extends StatefulWidget {
  const DeveloperStats({Key? key}) : super(key: key);

  @override
  State<DeveloperStats> createState() => _DeveloperStatsState();
}

class _DeveloperStatsState extends State<DeveloperStats> {
  @override
  Widget build(BuildContext context) {
    final metroidController = Get.put(MetroidController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Developer Stats"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: false,
          children: [
            FutureBuilder(
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return ListTile(
                      title: Text('${snapshot.error} occurred'),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as String;
                    return ListTile(
                      title: const Text("App User ID"),
                      subtitle: Text(
                        '$data',

                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: (){
                          //Copy the appUserID to the clipboard
                          Clipboard.setData(ClipboardData(text:'$data'));
                          Get.snackbar(
                              "Copied",
                              "appUserID saved to clipboard",
                              icon: Icon(Icons.copy),
                              snackPosition: SnackPosition.BOTTOM
                          );

                        },
                      ),
                    );
                  }
                }
                return ListTile(
                  title: const Text("App User ID"),
                  trailing: CircularProgressIndicator(),
                );

              },
              future: PurchaseApi.getAppUserID(),

            ),
            const Divider(thickness: 2,),
            ListTile(
              title: const Text("Open Count"),
              subtitle: Text("App Opened: ${MetroidPreferences.getOpenCount()} times"),
            ),
            const Divider(thickness: 2,),
            ListTile(
              title: const Text("First Used"),
                subtitle: Text("${TextHelper.formatDate(MetroidPreferences.getFirstUseDate()!)}"),
            ),
            const Divider(thickness: 2,),
            ListTile(
              title: const Text("App Purchased"),
              subtitle: Text("${MetroidPreferences.getAppPurchasedStatus() ?? false}"),
            ),
            const Divider(thickness: 2,),
            FutureBuilder(
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If we got an error
                    if (snapshot.hasError) {
                      return ListTile(
                        title: Text('${snapshot.error} occurred'),
                      );

                      // if we got our data
                    } else if (snapshot.hasData) {
                      // Extracting data from snapshot object
                      final data = snapshot.data as String;
                      return ListTile(
                        title: const Text("Purchase Date"),
                        subtitle: Text(
                          '$data',

                        ),
                      );
                    }
                  }
              return ListTile(
                title: const Text("Purchase Date"),
                trailing: CircularProgressIndicator(),
              );

            },
              future: getPurchaseDate(),

            ),
            const Divider(thickness: 2,),
            FutureBuilder(
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return ListTile(
                      title: Text('${snapshot.error} occurred'),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as String;
                    return ListTile(
                      title: const Text("Last Donation Date"),
                      subtitle: Text(
                        '$data',

                      ),
                    );
                  }
                }
                return ListTile(
                  title: const Text("Last Donation Date"),
                  trailing: CircularProgressIndicator(),
                );

              },
              future: getLastDonationDate(),

            ),
            const Divider(thickness: 2,),
            FutureBuilder(
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return ListTile(
                      title: Text('${snapshot.error} occurred'),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as String;
                    return ListTile(
                      title: const Text("Last Entitlement Check"),
                      subtitle: Text(
                        '$data',

                      ),
                    );
                  }
                }
                return ListTile(
                  title: const Text("Last Entitlement Check"),
                  trailing: CircularProgressIndicator(),
                );

              },
              future: getLastEntilementCheck(),

            ),
            const Divider(thickness: 2,),
            ListTile(
              title: Text("Show what's new dialog"),
              subtitle: Text("Trigger the what's new pop-up for testing purposes"),
              onTap: (){
                AboutAppCopy.getWhatsNewDialog(context);
                //StartupChecksUtil.showWhatsNewDialog();
              },
            ),
            const Divider(thickness: 2,),
            ListTile(
              title: const Text("Revert Purchase Status"),
              subtitle: const Text("Remove pro option and show ads by clicking here. If done in error purchases can be restored on the 'remove ads' page"),
              onTap: (){
                metroidController.revertPurchaseStatus();
                Get.snackbar(
                    "Reverted",
                    "User is no longer Pro on this app",
                    icon: const Icon(Icons.no_accounts),
                    snackPosition: SnackPosition.BOTTOM
                );
              },
            ),
            const Divider(thickness: 2,),
            ListTile(
              title: Text("Show onboarding demo"),
              subtitle: Text("Trigger the first use demo slideshow"),
              onTap: (){
                Get.to(() => const MetroidOnboarding());
              },
            ),
            const Divider(thickness: 2,),




          ],
        ),
      ),
    );
  }

  Future<String> getPurchaseDate() async {
    return  MetroidPreferences.getAppPurchasedStatus() ?? false ? TextHelper.formatDate(DateTime.parse(await PurchaseApi.getAppPurchaseDate(true))): "N/A";
  }

  Future<String> getLastDonationDate() async{
    return MetroidPreferences.getAppPurchasedStatus() ?? false ? TextHelper.formatDate(DateTime.parse(await PurchaseApi.getAppPurchaseDate(false))): "N/A";
  }

  Future<String> getLastEntilementCheck() async{
    return MetroidPreferences.getLastEntitlementCheckDate() != null ? TextHelper.formatDate(await MetroidPreferences.getLastEntitlementCheckDate()!): "N/A";
  }


}




// "Last Entitlement Check: ${FryerPreferences.getLastEntitlementCheckDate() != null ? TextHelper.formatDate(await FryerPreferences.getLastEntitlementCheckDate()!): "N/A"}\n\n"
// );
