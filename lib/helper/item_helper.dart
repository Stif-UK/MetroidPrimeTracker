import 'package:get/get.dart';
import 'package:metroid_prime_items/controller/metroid_controller.dart';
import 'package:metroid_prime_items/helper/item_generator.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/model/enums/region_enum.dart';
import 'package:metroid_prime_items/model/enums/item_type_enum.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/ui/remove_ads.dart';




class ItemHelper {

  static getItems() {
    return Hive.box<Items>("ItemBox");
  }

  static getTitle(ItemTypeEnum? type, RegionEnum? region) {
    if((type == null && region == null) || (type != null && region != null)){
      return const Text("Item Tracker");
    }
    if(type == null && region != null){
      return Text("${ItemHelper.getRegionName(region)}");
    }

    if(type != null && region == null){
      return Text("${getUpgradeTypeName(type.toString())}");
    }
    
    

  }

  static getCounts(ItemTypeEnum? type, RegionEnum? region) {
    final itemlist = getItems();


    if((type == null && region == null) || (type != null && region != null)){
      return const Text("");
    }
    if(type == null && region != null){
      int collected = itemlist.values.where((element) => element.region.toString() == region.toString() && element.collected == true).length;
      int total = itemlist.values.where((element) => element.region.toString() == region.toString()).length;
      return Text("$collected/$total", style: const TextStyle(fontWeight: FontWeight.bold),);
    }

    if(type != null && region == null){
      int collected = itemlist.values.where((element) => element.type == type.toString() && element.collected == true).length;
      int total = itemlist.values.where((element) => element.type == type.toString()).length;
      return Text("$collected/$total", style: const TextStyle(fontWeight: FontWeight.bold),);
    }



  }

  static Future addItem(String title, RegionEnum region, String room,
      ItemTypeEnum type) {
    String rg = region.toString();
    String tp = type.toString();

    final item = Items()
      ..title = title
      ..region = rg
      ..room = room
      ..type = tp
      ..collected = false
      ..description = "";

    final box = Hive.box<Items>("ItemBox");
    return box.add(item);
  }

  static Icon? getItemTypeIcon(String type) {
    Icon returnIcon;

    switch (type) {
      case "ItemTypeEnum.missile_expansion":
        {
          returnIcon = const Icon(FontAwesomeIcons.rocket);
        }
        break;
      case "ItemTypeEnum.energy_tank":
        {
          returnIcon = const Icon(Icons.electric_bolt);
        }
        break;
      case "ItemTypeEnum.power_bomb_upgrade":
        {
          returnIcon = const Icon(Icons.arrow_circle_up);
        }
        break;
      case "ItemTypeEnum.artefact":
        {
          returnIcon = const Icon(Icons.settings);
        }
        break;
      case "ItemTypeEnum.upgrade":
        {
          returnIcon = const Icon(Icons.accessibility);
        }
        break;

      default:
        {
          returnIcon = const Icon(Icons.question_mark);
        }
    }
    return returnIcon;
  }

  static String? getRegionName(RegionEnum region) {
    String returnString;

    switch (region) {
      case RegionEnum.tallon_overworld:
        {
          returnString = "Tallon Overworld";
        }
        break;
      case RegionEnum.chozo_ruins:
        {
          returnString = "Chozo Ruins";
        }
        break;
      case RegionEnum.magmoor_caverns:
        {
          returnString = "Magmoor Caverns";
        }
        break;
      case RegionEnum.phendrana_drifts:
        {
          returnString = "Phendrana Drifts";
        }
        break;
      case RegionEnum.phazon_mines:
        {
          returnString = "Phazon Mines";
        }
        break;

      default:
        {
          returnString = "";
        }
    }
    return returnString;
  }

  static String? getRegionNameFromString(String region) {
    String returnString;

    switch (region) {
      case "RegionEnum.tallon_overworld":
        {
          returnString = "Tallon Overworld";
        }
        break;
      case "RegionEnum.chozo_ruins":
        {
          returnString = "Chozo Ruins";
        }
        break;
      case "RegionEnum.magmoor_caverns":
        {
          returnString = "Magmoor Caverns";
        }
        break;
      case "RegionEnum.phendrana_drifts":
        {
          returnString = "Phendrana Drifts";
        }
        break;
      case "RegionEnum.phazon_mines":
        {
          returnString = "Phazon Mines";
        }
        break;

      default:
        {
          returnString = "";
        }
    }
    return returnString;
  }

  static String? getUpgradeTypeName(String type) {
    String returnString;

    switch (type) {
      case "ItemTypeEnum.upgrade":
        {
          returnString = "Upgrade";
        }
        break;
      case "ItemTypeEnum.missile_expansion":
        {
          returnString = "Missile Expansion";
        }
        break;
      case "ItemTypeEnum.power_bomb_upgrade":
        {
          returnString = "Power Bomb Upgrade";
        }
        break;
      case "ItemTypeEnum.energy_tank":
        {
          returnString = "Energy Tank";
        }
        break;
      case "ItemTypeEnum.artefact":
        {
          returnString = "Artifact";
        }
        break;

      default:
        {
          returnString = "";
        }
    }
    return returnString;
  }




  static double getRegionCompletion(RegionEnum region) {
    final itemBox = Hive.box<Items>("ItemBox");
    List<Items> filteredList = itemBox.values.where((item) =>
    item.region == region.toString()).toList();

    if (filteredList.length == 0){
      return 0.0;
    }

    int total = filteredList.length;
    int collected = filteredList
        .where((item) => item.collected == true)
        .length;

    double result = collected / total;
    return result;
  }

  static int getRegionCompletionInt(RegionEnum region){
    double preliminary = ItemHelper.getRegionCompletion(region);

    if(preliminary == 0.0){
      return 0;
    }

    int returnvalue =  (preliminary*100).round();
    return returnvalue;
  }

  static double getItemCompletion(ItemTypeEnum type) {
    final itemBox = Hive.box<Items>("ItemBox");
    List<Items> filteredList = itemBox.values.where((item) =>
    item.type == type.toString()).toList();

    if (filteredList.isEmpty){
      return 0.0;
    }

    int total = filteredList.length;
    int collected = filteredList
        .where((item) => item.collected == true)
        .length;

    double result = collected / total;
    return result;
  }

  static int getItemCompletionInt(ItemTypeEnum type){
    double preliminary = ItemHelper.getItemCompletion(type);

    if(preliminary == 0.0){
      return 0;
    }

    int returnvalue =  (preliminary*100).round();
    return returnvalue;
  }
  
  static bool isPrimeCollectionComplete(){
    
   return  getItemCompletionInt(ItemTypeEnum.missile_expansion) == 100 &&
    getItemCompletionInt(ItemTypeEnum.energy_tank) == 100 &&
    getItemCompletionInt(ItemTypeEnum.power_bomb_upgrade) == 100 &&
    getItemCompletionInt(ItemTypeEnum.artefact) == 100 &&
    getItemCompletionInt(ItemTypeEnum.upgrade) == 100;
  }

  static triggerCompleteDialog(BuildContext context){
    final mpController = Get.put(MetroidController());

    Get.defaultDialog(
        title: "Collection Complete!",
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("You've recorded 100% of items, congratulations!", style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
            mpController.isAppPro.value? const SizedBox(height: 0,): Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Text("Before enjoying the good ending, if you found the app useful please consider making a donation to help keep it alive", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),
            ),
            mpController.isAppPro.value? const SizedBox(height: 0,) : ElevatedButton(
                child: const Text("Donate"),
              onPressed: () => Get.to(() => RemoveAds()), )
          ],
        )
    );
  }

  static resetAllData(){
    final Box<Items> box = ItemHelper.getItems();
    int size = box.length;
    for(var index = 0; index < size; index++){
      Items? currentItem = box.getAt(index);
      currentItem?.collected = false;
      currentItem?.save();
    }
  }

  static resetAllNotes(){
    final Box<Items> box = ItemHelper.getItems();
    int size = box.length;
    for(var index = 0; index < size; index++){
      Items? currentItem = box.getAt(index);
      currentItem?.description = "";
      currentItem?.save();
    }
  }

}

