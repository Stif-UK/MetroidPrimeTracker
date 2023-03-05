import 'package:flutter/material.dart';
import 'package:metroid_prime_items/copy/whats_new_copy.dart';

class VersionHistory extends StatelessWidget {
  const VersionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Version History"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WhatsNewCopy.getVersionHistory(context)
          ],
        ),
      ),
    );
  }
}
