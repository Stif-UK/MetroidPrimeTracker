import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/model/enums/region_enum.dart';
import 'package:metroid_prime_items/model/enums/item_type_enum.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class ItemHelper {

  static getItems() {
    return Hive.box<Items>("ItemBox");
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

    print("Getting box to add item");
    final box = Hive.box<Items>("ItemBox");
    print("Adding item");
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
          returnString = "Artefact";
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

}