import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:metroid_prime_items/copy/privacypolicycopy.dart';

class PrivacyPolicy extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PrivacyPolicy"),
        leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text("Version: ${PrivacyPolicyCopy.versionNumber} ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text("Date: ${PrivacyPolicyCopy.policyDate}"),
            ),
            const Divider(thickness: 2.0,),

            Expanded(
                child: Markdown(data: PrivacyPolicyCopy.privacyWording,)
            ),
          ],),
      ),
    );
  }
}