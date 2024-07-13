import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:metroid_prime_items/controller/metroid_controller.dart';
import 'package:metroid_prime_items/model/adUnits.dart';
import 'package:metroid_prime_items/model/enums/item_type_enum.dart';
import 'package:get/get.dart';
import '../helper/ad_widget_helper.dart';
import '../provider/adstate.dart';
import 'ItemListView.dart';
import '../helper/item_helper.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:provider/provider.dart';

class ItemsTypeUI extends StatefulWidget {
  ItemsTypeUI({Key? key}) : super(key: key);
  final metroidController = Get.put(MetroidController());

  @override
  State<ItemsTypeUI> createState() => _ItemsTypeUIState();
}

class _ItemsTypeUIState extends State<ItemsTypeUI> {

  BannerAd? banner;
  bool purchaseStatus = MetroidPreferences.getAppPurchasedStatus() ?? false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(!purchaseStatus)
    {
      final adState = Provider.of<AdState>(context);
      adState.initialization.then((status) {
        setState(() {
          banner = BannerAd(
              adUnitId: AdUnits.itemsUIBannerAdUnitId,
              //adUnitId: WristCheckConfig.prodBuild == false? adState.getTestAds : AdUnits.viewWatchBannerAdUnitId,
              //If the device screen is large enough display a larger ad on this screen
              size: AdSize.banner,
              request: const AdRequest(),
              listener: adState.adListener)
            ..load();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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

              ),
            ),
          ),
          //insert ad
          widget.metroidController.isAppPro.value || widget.metroidController.isDrawerOpen.value? const SizedBox(height: 0,) : AdWidgetHelper.buildSmallAdSpace(banner, context),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }
}
