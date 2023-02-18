import 'package:flutter/material.dart';
import 'package:metroid_prime_items/copy/aboutapp_copy.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App"),
      ),
      body: AboutAppCopy.getAboutAppCopy(),
    );
  }
}
