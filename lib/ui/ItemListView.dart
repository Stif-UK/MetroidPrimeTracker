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
  final RegionEnum? region;
  final ItemTypeEnum? type;

  const ItemListView({super.key, required this.region, required this.type});


  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  
  final itemBox = Hive.box<Items>("ItemBox");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ItemHelper.getTitle(widget.type, widget.region),

      ),
      body: ValueListenableBuilder<Box<Items>>(
          valueListenable: itemBox.listenable(),
          builder: (context, box, _){
            List<Items> filteredList = [];

            if(widget.region != null){
              filteredList =  itemBox.values.where((item) => item.region == widget.region.toString()).toList();
            }

            if(widget.type != null){
              filteredList =  itemBox.values.where((item) => item.type == widget.type.toString()).toList();
            }

            if(widget.region != null && widget.type != null){
              filteredList = [];
            }






            return filteredList.isEmpty?Container(
              alignment: Alignment.center,
              child: const Text("Something's gone wrong! No items found!\n",
                textAlign: TextAlign.center,),
            ):

            ListView.separated(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index){
                var currentItem = filteredList.elementAt(index);


                return ListTile(
                  title: Text(currentItem!.room),
                    subtitle: Text(currentItem.title),
                  trailing: ItemHelper.getItemTypeIcon(currentItem.type),
                  leading: currentItem.collected? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
                  onTap:(){
                    setState(() {
                      currentItem.collected = !currentItem.collected;
                      currentItem.save();
                    });
                  } ,
                );
                // return CheckboxListTile(
                //   title: Text(currentItem!.room),
                //     subtitle: Text(currentItem.title),
                //     controlAffinity: ListTileControlAffinity.leading,
                //     value: currentItem.collected,
                //     secondary: ItemHelper.getItemTypeIcon(currentItem.type),
                //     onChanged: (bool? value){
                //     setState(() {
                //       currentItem.collected = value!;
                //       currentItem.save();
                //     });
                //     });
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
