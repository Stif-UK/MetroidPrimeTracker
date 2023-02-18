import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/copy/aboutapp_copy.dart';

class ResetAll extends StatelessWidget {
  const ResetAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset All"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutAppCopy.getResetAllCopy(),
          const SizedBox(height: 40,),
          ElevatedButton(
            onPressed: (){},
              // onPressed: () {Get.to(() =>  const ItemListView(region: null, type: ItemTypeEnum.upgrade,))!.then((value) =>
              // {if (value == null) {
              //   setState((){})
              // }});},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.black)
                      )

                  )
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Reset All Data",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ],
      ),
    );
  }
}
