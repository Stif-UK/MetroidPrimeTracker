import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:metroid_prime_items/model/enums/region_enum.dart';
import 'package:metroid_prime_items/model/enums/item_type_enum.dart';
import 'package:hive/hive.dart';

class ItemHelper{

  static getItems(){
    return Hive.box("ItemBox");
  }

  static Future addItem(String title, RegionEnum region, String room, ItemTypeEnum type){

    String rg = region.toString();
    String tp = type.toString();

    final item = Items()
      ..title = title
    ..region = rg
    ..room = room
    ..type = tp
    ..collected = false
    ..description = "";

    final box = ItemHelper.getItems();

    return box.add(item);

  }

  static generateItems(){
    //Tallon Overworld
    ItemHelper.addItem("Space Jump Boots", RegionEnum.tallon_overworld, "Alcove", ItemTypeEnum.upgrade);
    ItemHelper.addItem("X-Ray Visor", RegionEnum.tallon_overworld, "Life Grove", ItemTypeEnum.upgrade);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Landing Site", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Transport Tunnel B", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Overgrown Cavern", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Frigate Crash Site", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "BioHazard Containment", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Arbor Chamber", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Root Cave", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Great Tree Chamber", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Missile Expansion", RegionEnum.tallon_overworld, "Life Grove Tunnel", ItemTypeEnum.missile_expansion);
    ItemHelper.addItem("Energy Tank", RegionEnum.tallon_overworld, "Cargo Freight Lift to Deck Gamma", ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Energy Tank", RegionEnum.tallon_overworld, "Hydro Access Tunnel", ItemTypeEnum.energy_tank);
    ItemHelper.addItem("Artifact of Truth", RegionEnum.tallon_overworld, "Artifact Temple", ItemTypeEnum.artefact);
    ItemHelper.addItem("Artifact of Chozo", RegionEnum.tallon_overworld, "Life Grove", ItemTypeEnum.artefact);

    //Chozo Ruins

    //Magmoor Caverns

    //Phendrana Drifts

    //Phazon Mines
  }


}