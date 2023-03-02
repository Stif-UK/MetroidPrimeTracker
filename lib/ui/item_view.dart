import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:metroid_prime_items/model/adUnits.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helper/ad_widget_helper.dart';
import '../model/metroid_preferences.dart';
import '../provider/adstate.dart';

class ItemView extends StatefulWidget {

  final Items currentItem;

const ItemView({
  Key? key,
  required this.currentItem}): super(key: key);


  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {

  //form key to allow access to the form state
  final GlobalKey<FormState> _editKey = GlobalKey<FormState>();
  String _notes = "";

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
              adUnitId: AdUnits.itemViewBannerAdUnitId,
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
    _notes = widget.currentItem.description;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.currentItem.title),
      ),
      body: Column(
        children: [
          //insert ad
          purchaseStatus? const SizedBox(height: 0,) : AdWidgetHelper.buildSmallAdSpace(banner, context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Region: ${ItemHelper.getRegionNameFromString(widget.currentItem.region)}"),
                  ),
                  const Divider(thickness: 2,),
                  ListTile(
                    title: Text("Room: ${widget.currentItem.room}"),
                  ),
                  const Divider(thickness: 2,),

                  SwitchListTile(
                    title: const Text("Collected:"),
                      value: widget.currentItem.collected,
                      onChanged: (value){
                      setState(() {
                        widget.currentItem.collected = value;
                        widget.currentItem.save();
                      });
                      }),
                  const Divider(thickness: 2,),

                  const ListTile(
                    title: Text("Notes:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _editKey,
                      child: TextFormField(
                        initialValue: widget.currentItem.description,
                        enabled: true,
                        maxLines: 5,
                        onSaved: (String? value){
                          value != null? _notes = value : _notes = "";
                          FocusManager.instance.primaryFocus?.unfocus();
                        } ,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor,
                                )
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue
                                )
                            )
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: (){
                          _editKey.currentState?.save();
                          widget.currentItem.description = _notes;
                          widget.currentItem.save();
                          Get.snackbar(
                            widget.currentItem.title, 'Note Saved',
                            icon: ItemHelper.getItemTypeIcon(widget.currentItem.type,),
                            snackPosition: SnackPosition.BOTTOM
                          );
                        },
                        child: const Text("Save Note"),),
                  )
                ],

              ),
            ),
          ),

        ],
      )
    );
  }
}
