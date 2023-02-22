import 'package:flutter/material.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:metroid_prime_items/ui/item_view.dart';
import 'package:get/get.dart';
import 'package:metroid_prime_items/helper/item_helper.dart';


class SearchFinder extends StatelessWidget {
  final String query;

  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<Items>('ItemBox').listenable(),
        builder:
        (context, Box<Items> itemBox,_){
          var results = query.isEmpty
              ? itemBox.values.toList() //whole list
              : itemBox.values.where((item) => item.room.toLowerCase().contains(query)).toList();

          return results.isEmpty
          //if there are no results, return 'no results' page
              ? const Center(
            child: Text('No results found',),
          )
              : ListView.builder(
            physics: const BouncingScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (context, index){
              //passing as a custom list
                final Items item = results[index];

                return ListTile(
                  isThreeLine: true,
                  onTap: (){
                    //This is where we update index so that we can find the right screen to go to
                    Get.to(() => ItemView(currentItem: item));
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.room)
                    ],
                  ),
                  subtitle: Text("${ItemHelper.getRegionNameFromString(item.region)}\n${ItemHelper.getUpgradeTypeName(item.type)}"),
                  leading: item.collected? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank),
                  trailing: ItemHelper.getItemTypeIcon(item.type),

                );
              }

          );
        }
    );
  }
}
