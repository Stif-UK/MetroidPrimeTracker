import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';
import 'package:metroid_prime_items/model/enums/item_type_enum.dart';
import 'package:metroid_prime_items/model/enums/region_enum.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';

class ItemListView extends StatefulWidget {
  //const ItemListView({Key? key}) : super(key: key);

  //final String title;
  final RegionEnum region;

  const ItemListView({super.key, required this.region});


  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {

  final itemBox = Hive.box<Items>("ItemBox");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.region.toString()),

      ),
      body: ValueListenableBuilder<Box<Items>>(
          valueListenable: itemBox.listenable(),
          builder: (context, box, _){
            //List<Items> filteredList = Boxes.getCollectionWatches();



            return itemBox.isEmpty?Container(
              alignment: Alignment.center,
              child: const Text("Something's gone wrong! No items found!\n",
                textAlign: TextAlign.center,),
            ):

            ListView.separated(
              itemCount: itemBox.length,
              itemBuilder: (BuildContext context, int index){
                var currentItem = itemBox.getAt(index);


                return CheckboxListTile(
                  title: Text(currentItem!.room),
                    subtitle: Text(currentItem.type.toString()),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: currentItem.collected,
                    secondary: ItemHelper.getItemTypeIcon(currentItem.type),
                    onChanged: (bool? value){
                    setState(() {
                      currentItem.collected = value!;
                      currentItem.save();
                    });
                    });
              },
              separatorBuilder: (context, index){
                return const Divider(thickness: 2,);
              },
            );
          }


      ),
    );
  }
}
