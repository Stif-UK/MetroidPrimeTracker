import 'package:flutter/material.dart';
import 'package:metroid_prime_items/model/enums/item_type_enum.dart';
import 'package:get/get.dart';
import 'ItemListView.dart';
import '../helper/item_helper.dart';

class ItemsTypeUI extends StatefulWidget {
  const ItemsTypeUI({Key? key}) : super(key: key);

  @override
  State<ItemsTypeUI> createState() => _ItemsTypeUIState();
}

class _ItemsTypeUIState extends State<ItemsTypeUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        //Button 1: Missile Upgrades
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {Get.to(() =>  const ItemListView(region: null, type: ItemTypeEnum.missile_expansion,))!.then((value) =>
              {if (value == null) {
                setState((){})
              }});},
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
                child: Text("Missile Upgrades",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: ItemHelper.getItemCompletion(ItemTypeEnum.missile_expansion),),
                )),
            Text("${ItemHelper.getItemCompletionInt(ItemTypeEnum.missile_expansion)}%")
          ],
        ),
        const Divider(thickness: 4,),

        //Button 2: Energy Tanks
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {Get.to(() =>  const ItemListView(region: null, type: ItemTypeEnum.energy_tank,))!.then((value) =>
              {if (value == null) {
                setState((){})
              }});},
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
                child: Text("Energy Tanks",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: ItemHelper.getItemCompletion(ItemTypeEnum.energy_tank),),
                )),
            Text("${ItemHelper.getItemCompletionInt(ItemTypeEnum.energy_tank)}%")
          ],
        ),
        const Divider(thickness: 4,),

        //Button 3: Power Bombs
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {Get.to(() =>  const ItemListView(region: null, type: ItemTypeEnum.power_bomb_upgrade,))!.then((value) =>
              {if (value == null) {
                setState((){})
              }});},
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
                child: Text("Power Bombs",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: ItemHelper.getItemCompletion(ItemTypeEnum.power_bomb_upgrade),),
                )),
            Text("${ItemHelper.getItemCompletionInt(ItemTypeEnum.power_bomb_upgrade)}%")
          ],
        ),
        const Divider(thickness: 4,),


        //Button 4: Artifacts
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {Get.to(() =>  const ItemListView(region: null, type: ItemTypeEnum.artefact,))!.then((value) =>
              {if (value == null) {
                setState((){})
              }});},
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
                child: Text("Artifacts",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: ItemHelper.getItemCompletion(ItemTypeEnum.artefact),),
                )),
            Text("${ItemHelper.getItemCompletionInt(ItemTypeEnum.artefact)}%")
          ],
        ),
        const Divider(thickness: 4,),


        //Button 5: Upgrades
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {Get.to(() =>  const ItemListView(region: null, type: ItemTypeEnum.upgrade,))!.then((value) =>
              {if (value == null) {
                setState((){})
              }});},
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
                child: Text("Upgrades",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: ItemHelper.getItemCompletion(ItemTypeEnum.upgrade),),
                )),
            Text("${ItemHelper.getItemCompletionInt(ItemTypeEnum.upgrade)}%")
          ],
        ),
        const Divider(thickness: 4,),


      ],

    );
  }
}
