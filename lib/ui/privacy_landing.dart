import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/ui/privacy_policy.dart';

class PrivacyLanding extends StatelessWidget {
  const PrivacyLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: Column(
        children: [
          ListTile(title: const Text("Privacy Policy"),
          leading: const Icon(Icons.privacy_tip_outlined),
          onTap: (){
            Get.to(() => PrivacyPolicy());
          }),
          ListTile(title: const Text("Privacy Settings"),
          leading: const Icon(Icons.settings),)
        ],
      ),
    );
  }
}
