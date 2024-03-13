import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/controller/metroid_controller.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:metroid_prime_items/model/enums/region_enum.dart';
import 'package:metroid_prime_items/ui/ItemListView.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:metroid_prime_items/model/adUnits.dart';
import 'package:metroid_prime_items/provider/adstate.dart';
import 'package:metroid_prime_items/helper/ad_widget_helper.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:provider/provider.dart';


class RegionsUI extends StatefulWidget {
  RegionsUI({Key? key}) : super(key: key);
  final metroidController = Get.put(MetroidController());

  @override
  State<RegionsUI> createState() => _RegionsUIState();
}

class _RegionsUIState extends State<RegionsUI> {

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
              adUnitId: AdUnits.regionUIBannerAdUnitId,
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

                  //Button 1: Tallon Overworld
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {Get.to(() =>  const ItemListView(region: RegionEnum.tallon_overworld, type: null,))!.then((value) =>
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
                          child: Text("Tallon Overworld",
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
                            child: LinearProgressIndicator(value: ItemHelper.getRegionCompletion(RegionEnum.tallon_overworld),),
                          )),
                      Text("${ItemHelper.getRegionCompletionInt(RegionEnum.tallon_overworld)}%")
                    ],
                  ),
                  const Divider(thickness: 4,),

                  //Button 2: Chozo Ruins
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {Get.to(() =>  const ItemListView(region: RegionEnum.chozo_ruins, type: null))!.then((value) =>
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
                          child: Text("Chozo Ruins",
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
                            child: LinearProgressIndicator(value: ItemHelper.getRegionCompletion(RegionEnum.chozo_ruins),),
                          )),
                      Text("${ItemHelper.getRegionCompletionInt(RegionEnum.chozo_ruins)}%")
                    ],
                  ),
                  const Divider(thickness: 4,),

                  //Button 3: Magmoor Caverns
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {Get.to(() =>  const ItemListView(region: RegionEnum.magmoor_caverns, type: null))!.then((value) =>
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
                          child: Text("Magmoor Caverns",
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
                            child: LinearProgressIndicator(value: ItemHelper.getRegionCompletion(RegionEnum.magmoor_caverns),),
                          )),
                      Text("${ItemHelper.getRegionCompletionInt(RegionEnum.magmoor_caverns)}%")
                    ],
                  ),
                  const Divider(thickness: 4,),


                  //Button 4: Phendrana Drifts
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {Get.to(() =>  const ItemListView(region: RegionEnum.phendrana_drifts, type: null))!.then((value) =>
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
                          child: Text("Phendrana Drifts",
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
                            child: LinearProgressIndicator(value: ItemHelper.getRegionCompletion(RegionEnum.phendrana_drifts),),
                          )),
                      Text("${ItemHelper.getRegionCompletionInt(RegionEnum.phendrana_drifts)}%")
                    ],
                  ),
                  const Divider(thickness: 4,),


                  //Button 5: Phazon Mines
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {Get.to(() =>  const ItemListView(region: RegionEnum.phazon_mines, type: null))!.then((value) =>
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
                          child: Text("Phazon Mines",
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
                            child: LinearProgressIndicator(value: ItemHelper.getRegionCompletion(RegionEnum.phazon_mines),),
                          )),
                      Text("${ItemHelper.getRegionCompletionInt(RegionEnum.phazon_mines)}%")
                    ],
                  ),
                  const Divider(thickness: 4,),


                ],

              ),
            ),
          ),
          //insert ad
          widget.metroidController.isAppPro.value? const SizedBox(height: 0,) : AdWidgetHelper.buildSmallAdSpace(banner, context),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }
}
