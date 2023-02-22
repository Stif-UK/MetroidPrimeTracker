import 'package:flutter/material.dart';
import 'package:metroid_prime_items/ui/ItemTypeUI.dart';
import 'package:metroid_prime_items/ui/search.dart';
import 'RegionsUI.dart';
import 'navbar.dart';

class MetroidHome extends StatefulWidget {
  const MetroidHome({Key? key}) : super(key: key);

  @override
  State<MetroidHome> createState() => _MetroidHomeState();
}

class _MetroidHomeState extends State<MetroidHome> {
  var _showRegions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showRegions? const Text("Tallon Regions"): const Text("Item Types"),
        actions: [
          IconButton(
              icon: _showRegions? const Icon(Icons.dataset_outlined): const Icon(Icons.map),
          onPressed: (){
                setState(() {
                  _showRegions = !_showRegions;
                });
          },),

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
              showSearch(
                  context: context,
                  delegate: SearchWidget());
            },
          )
        ],
      ),
      drawer: const NavBar(),
      body: _showRegions? const RegionsUI(): const ItemsTypeUI(),
    );
  }
}

