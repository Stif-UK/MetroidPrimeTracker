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
        title: Text(ItemHelper.getRegionName(widget.region)!),

      ),
      body: ValueListenableBuilder<Box<Items>>(
          valueListenable: itemBox.listenable(),
          builder: (context, box, _){
            List<Items> filteredList = itemBox.values.where((item) => item.region == widget.region.toString()).toList();



            return filteredList.isEmpty?Container(
              alignment: Alignment.center,
              child: const Text("Something's gone wrong! No items found!\n",
                textAlign: TextAlign.center,),
            ):

            ListView.separated(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index){
                var currentItem = filteredList.elementAt(index);


                return CheckboxListTile(
                  title: Text(currentItem!.room),
                    subtitle: Text(ItemHelper.getUpgradeTypeName(currentItem.type)!),
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
