import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/model/enums/region_enum.dart';
import 'package:metroid_prime_items/model/enums/item_type_enum.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

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
          returnIcon = const Icon(Icons.ac_unit);
        }
        break;
      case "ItemTypeEnum.energy_tank":
        {
          returnIcon = const Icon(Icons.electric_bolt);
        }
        break;
      case "ItemTypeEnum.power_bomb_upgrade":
        {
          returnIcon = const Icon(Icons.sunny);
        }
        break;
      case "ItemTypeEnum.artefact":
        {
          returnIcon = const Icon(Icons.settings);
        }
        break;
      case "ItemTypeEnum.upgrade":
        {
          returnIcon = const Icon(Icons.add_box_outlined);
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


  static generateItems() {
    print("starting to generate items");

    //Tallon Overworld
    ItemHelper.addItem(
        "Space Jump Boots", RegionEnum.tallon_overworld, "Alcove",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem("X-Ray Visor", RegionEnum.tallon_overworld, "Life Grove",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Landing Site",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Transport Tunnel B",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Overgrown Cavern",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Frigate Crash Site",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld,
        "BioHazard Containment", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Arbor Chamber",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Root Cave",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Great Tree Chamber",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.tallon_overworld, "Life Grove Tunnel",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Energy Tank", RegionEnum.tallon_overworld,
        "Cargo Freight Lift to Deck Gamma", ItemTypeEnum.energy_tank);
    ItemHelper.addItem(
        "Energy Tank", RegionEnum.tallon_overworld, "Hydro Access Tunnel",
        ItemTypeEnum.energy_tank);
    ItemHelper.addItem(
        "Artifact of Truth", RegionEnum.tallon_overworld, "Artifact Temple",
        ItemTypeEnum.artefact);
    ItemHelper.addItem(
        "Artifact of Chozo", RegionEnum.tallon_overworld, "Life Grove",
        ItemTypeEnum.artefact);

    //Chozo Ruins
    ItemHelper.addItem("Missile Launcher", RegionEnum.chozo_ruins, "Hive Totem",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem("Morph Ball", RegionEnum.chozo_ruins, "Ruined Shrine",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem("Varia Suit", RegionEnum.chozo_ruins, "SunChamber",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem("Charge Beam", RegionEnum.chozo_ruins, "Watery Hall",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem("Morph Ball Bomb", RegionEnum.chozo_ruins, "Burn Dome",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem("Ice Beam", RegionEnum.chozo_ruins, "Antechamber",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem("Wavebuster", RegionEnum.chozo_ruins, "Tower of Light",
        ItemTypeEnum.upgrade);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Main Plaza",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Main Plaza",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Main Plaza",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Ruined Nursery",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Ruined Gallery",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Ruined Gallery",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Ruined Shrine",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Ruined Shrine",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.chozo_ruins, "Vault",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Ruined Fountain",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Gathering Hall",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Watery Hall Access",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Watery Hall",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.chozo_ruins, "Burn Dome",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.chozo_ruins, "Furnace",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.chozo_ruins, "Dynamo",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.chozo_ruins, "Dynamo",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.chozo_ruins, "Crossway",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Missile Expansion", RegionEnum.chozo_ruins, "Training Chamber Access",
        ItemTypeEnum.missile_expansion);
    ItemHelper.addItem(
        "Power Bomb Upgrade", RegionEnum.chozo_ruins, "Magma Pool",
        ItemTypeEnum.power_bomb_upgrade);
    ItemHelper.addItem("Energy Tank", RegionEnum.chozo_ruins, "Main Plaza",
        ItemTypeEnum.energy_tank);
    ItemHelper.addItem(
        "Energy Tank", RegionEnum.chozo_ruins, "Transport Access North",
        ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Energy Tank", RegionEnum.chozo_ruins, "Furnace",
        ItemTypeEnum.energy_tank);
    ItemHelper.addItem(
        "Energy Tank", RegionEnum.chozo_ruins, "Hall of the Elders",
        ItemTypeEnum.energy_tank);
    ItemHelper.addItem(
        "Energy Tank", RegionEnum.chozo_ruins, "Training Chamber",
        ItemTypeEnum.energy_tank);
    ItemHelper.addItem(
        "Artifact of Lifegiver", RegionEnum.chozo_ruins, "Tower Chamber",
        ItemTypeEnum.artefact);
    ItemHelper.addItem("Artifact of Wild", RegionEnum.chozo_ruins, "Sunchamber",
        ItemTypeEnum.artefact);
    ItemHelper.addItem(
        "Artifact of World", RegionEnum.chozo_ruins, "Elder Chamber",
        ItemTypeEnum.artefact);


    //Magmoor Caverns
    ItemHelper.addItem("Ice Spreader", RegionEnum.magmoor_caverns, "Shore Tunnel", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Plasma Beam", RegionEnum.magmoor_caverns, "Plasma Processing", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Missile Expansion", RegionEnum.magmoor_caverns, "Storage Cavern", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.magmoor_caverns, "Triclops Pit", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.magmoor_caverns, "Fiery Shores", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Power Bomb Upgrade", RegionEnum.magmoor_caverns, "Warrior Shrine", ItemTypeEnum.power_bomb_upgrade);
    ItemHelper.addItem("Energy Tank", RegionEnum.magmoor_caverns, "Transport Tunnel A", ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Energy Tank", RegionEnum.magmoor_caverns, "Magmoor Workstation", ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Artifact of Nature", RegionEnum.magmoor_caverns, "Lava Lake", ItemTypeEnum.artefact);
    ItemHelper.addItem("Artifact of Strength", RegionEnum.magmoor_caverns, "Warrior Shrine", ItemTypeEnum.artefact);

    //Phendrana Drifts
    ItemHelper.addItem("Boost Ball", RegionEnum.phendrana_drifts, "Phendrana Canyon", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Wave Beam", RegionEnum.phendrana_drifts, "Chapel of the Elders", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Super Missile", RegionEnum.phendrana_drifts, "Observatory", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Thermal Visor", RegionEnum.phendrana_drifts, "Research Core", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Spider Ball", RegionEnum.phendrana_drifts, "Quarantine Cave", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Gravity Suit", RegionEnum.phendrana_drifts, "Gravity Chamber", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Phendrana Shorelines", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Phendrana Shorelines", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Ice Ruins East", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Ice Ruins East", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Research Lab Hydra", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Research Lab Aether", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Frost Cave", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Gravity Chamber", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.phendrana_drifts, "Quarantine Monitor", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Power Bomb Upgrade", RegionEnum.phendrana_drifts, "Ice Ruins West", ItemTypeEnum.power_bomb_upgrade);
    ItemHelper.addItem("Power Bomb Upgrade", RegionEnum.phendrana_drifts, "Security Cave", ItemTypeEnum.power_bomb_upgrade);
    ItemHelper.addItem("Energy Tank", RegionEnum.phendrana_drifts, "Ruined Courtyard", ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Energy Tank", RegionEnum.phendrana_drifts, "Research Lab Aether", ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Energy Tank", RegionEnum.phendrana_drifts, "Transport Access", ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Artifact of Elder", RegionEnum.phendrana_drifts, "Control Tower", ItemTypeEnum.artefact);
    ItemHelper.addItem("Artifact of Sun", RegionEnum.phendrana_drifts, "Chozo Ice Temple", ItemTypeEnum.artefact);
    ItemHelper.addItem("Artifact of Spirit", RegionEnum.phendrana_drifts, "Storage Cavern", ItemTypeEnum.artefact);



    //Phazon Mines
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