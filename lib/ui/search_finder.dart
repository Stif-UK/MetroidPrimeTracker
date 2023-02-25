import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:metroid_prime_items/ui/item_view.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:provider/provider.dart';

import '../helper/ad_widget_helper.dart';
import '../model/metroid_preferences.dart';
import '../provider/adstate.dart';


class SearchFinder extends StatefulWidget {
  final String query;

  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  State<SearchFinder> createState() => _SearchFinderState();
}

class _SearchFinderState extends State<SearchFinder> {

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
              adUnitId: adState.getTestAds,//TODO: Get correct adunit for page
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
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: Hive.box<Items>('ItemBox').listenable(),
              builder:
              (context, Box<Items> itemBox,_){
                var results = widget.query.isEmpty
                    ? itemBox.values.toList() //whole list
                    : itemBox.values.where((item) => item.room.toLowerCase().contains(widget.query)).toList();

                return results.isEmpty
                //if there are no results, return 'no results' page
                    ? const Center(
                  child: Text('No results found',),
                )
                    : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                    itemCount: results.length,
                    itemBuilder: (context, index){
                    //passing as a custom list
                      final Items item = results[index];

                      return ListTile(
                        isThreeLine: true,
                        onTap: (){
                          //This is where we update index so that we can find the right screen to go to
                          Get.to(() => ItemView(currentItem: item));
                        },
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.room)
                          ],
                        ),
                        subtitle: Text("${ItemHelper.getRegionNameFromString(item.region)}\n${ItemHelper.getUpgradeTypeName(item.type)}"),
                        leading: item.collected? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank),
                        trailing: ItemHelper.getItemTypeIcon(item.type),

                      );
                    }

                );
              }
          ),
        ),
        //insert ad
        purchaseStatus? const SizedBox(height: 0,) : AdWidgetHelper.buildSmallAdSpace(banner, context),
        const SizedBox(height: 50,)
      ],
    );
  }
}
