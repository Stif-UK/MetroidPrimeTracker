import 'package:flutter/material.dart';
import 'package:metroid_prime_items/model/itemsmodel.dart';

class ItemView extends StatefulWidget {

  final Items currentItem;

const ItemView({
  Key? key,
  required this.currentItem}): super(key: key);


  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentItem.title),
      ),
      body: Column(
        children: [
          Text("Region: ${widget.currentItem.region}"),
          const SizedBox(height: 10,),
          Text("Room: ${widget.currentItem.room}"),
          const SizedBox(height: 10,),
          Text("Item: ${widget.currentItem.title}"),
          const SizedBox(height: 10,),
          Text("Notes: ${widget.currentItem.description}"),

        ],
      ),
    );
  }
}
