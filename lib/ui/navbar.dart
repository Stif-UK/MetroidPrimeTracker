import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:metroid_prime_items/ui/about_app.dart';
import 'package:metroid_prime_items/ui/privacy_policy.dart';
import 'package:metroid_prime_items/ui/attributions.dart';
import 'package:metroid_prime_items/ui/resetAll.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

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
                  print(clickCounter);
                  clickCounter++;
                  print(clickCounter);
                  if (clickCounter > 5) {
                    Get.defaultDialog(
                      title: "Open Count",
                      middleText: MetroidPreferences.getOpenCount().toString()
                    );
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
                const SizedBox(height: 100,),
                ListTile(
                  title: const Text("Reset all Data"),
                  trailing: const Icon(Icons.delete_outline),
                  onTap: (){
                    Get.to(() => const ResetAll());
                  },
                )
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
