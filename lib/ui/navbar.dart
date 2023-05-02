import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metroid_prime_items/controller/metroid_controller.dart';
import 'package:metroid_prime_items/copy/remove_ads_copy.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:metroid_prime_items/ui/about_app.dart';
import 'package:metroid_prime_items/ui/developer_stats.dart';
import 'package:metroid_prime_items/ui/privacy_policy.dart';
import 'package:metroid_prime_items/ui/attributions.dart';
import 'package:metroid_prime_items/ui/remove_ads.dart';
import 'package:metroid_prime_items/ui/resetAll.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/ui/version_history.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:in_app_review/in_app_review.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);
  final metroidController = Get.put(MetroidController());

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final InAppReview inAppReview = InAppReview.instance;
  String _buildVersion = "Not Determined";

  @override
  void initState() {
    super.initState();
    _getBuildVersion().then((val) {
      setState(() {
        _buildVersion = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int clickCounter =0;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(child: IconButton(
                  splashColor: Colors.transparent,
                icon: const Icon(FontAwesomeIcons.gamepad, size: 40.0),
            onPressed: (){
                  clickCounter++;
                  if (clickCounter > 5) {
                    Get.to(() => const DeveloperStats());
                  }
            },

            )),

                ListTile(
                  title: const Text("Privacy Policy"),
                  trailing: const Icon(Icons.privacy_tip_outlined),
                  onTap: (){
                    Get.to(() => PrivacyPolicy());
                  },
                ),
                ListTile(
                  title: const Text("About App"),
                  trailing: const Icon(Icons.info_outline),
                  onTap: (){
                    Get.to(() => const AboutApp());
                  },
                ),
                ListTile(
                  title: const Text("Attributions"),
                  trailing: const Icon(Icons.check_box_outlined),
                  onTap: (){
                    Get.to(() => const Attributions());
                  },
                ),
                ListTile(
                  title: const Text("Version History"),
                  trailing: const Icon(Icons.history),
                  onTap: (){
                    Get.to(() => const VersionHistory());
                  },
                ),
                const Divider(thickness: 2,),
                ListTile(
                  title: const Text("Leave an App Review"),
                  trailing: const Icon(Icons.reviews_outlined),
                  onTap: (){
                    inAppReview.openStoreListing(
                        appStoreId: "1672864012"
                    );
                  },
                ),
                const Divider(thickness: 2,),
                ListTile(
                  title:  widget.metroidController.isAppPro.value? RemoveAdsCopy.getPageTitleSupporter() :RemoveAdsCopy.getPageTitle(),
                  trailing: const Icon(Icons.money_off_csred_rounded),
                  onTap: (){
                    Get.to(() => RemoveAds());
                  },
                ),
                const Divider(thickness: 2,),
                const SizedBox(height: 100,),
                const Divider(thickness: 2,),
                ListTile(
                  title: const Text("Manage Data"),
                  trailing: const Icon(Icons.delete_outline),
                  onTap: (){
                    Get.to(() => const ResetAll());
                  },
                ),
                const Divider(thickness: 2,),

              ],
            ),
          ),
          Text("App Version: $_buildVersion "),
          const SizedBox(height: 25,)
        ],
      ),
    );
  }

  Future<String> _getBuildVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;

  }
}
