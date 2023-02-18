import 'package:flutter/material.dart';
import 'package:metroid_prime_items/copy/aboutapp_copy.dart';

class Attributions extends StatelessWidget {
  const Attributions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attributions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ExpansionTile(title: const Text("FontAwesome"),
            children: [
              AboutAppCopy.getAttributionFontAwesome()
            ],),
            ExpansionTile(title: const Text("Hive Database"),
            children: [
              AboutAppCopy.getAttributionHive(),
            ],),
            ExpansionTile(title: const Text("GetX"),
              children: [
                AboutAppCopy.getAttributionGetX(),
              ],),
          ],
        ),
      ),
    );
  }
}
