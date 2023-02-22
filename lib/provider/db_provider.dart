import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';


class DatabaseProvider extends ChangeNotifier {

  int _selectedIndex = 0;

  final Box<Items> _itemBox = Hive.box<Items>("ItemBox");

  Items _selectedItem = Items();

  Box<Items> get itemBox => _itemBox;

  Items get selectedWatch => _selectedItem;

  ///* Updating the current selected index for that contact to pass to read from hive
  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    updateSelectedWatch();
    notifyListeners();
  }

  ///* Updating the current selected contact from hive
  void updateSelectedWatch() {
    _selectedItem = readFromHive();
    notifyListeners();
  }

  ///* reading the current selected contact from hive
  Items readFromHive() {
    Items getWatch = _itemBox.getAt(_selectedIndex)!;

    return getWatch;
  }

  void deleteFromHive(){
    _itemBox.deleteAt(_selectedIndex);
  }
}