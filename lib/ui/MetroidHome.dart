import 'package:flutter/material.dart';

class MetroidHome extends StatefulWidget {
  const MetroidHome({Key? key}) : super(key: key);

  @override
  State<MetroidHome> createState() => _MetroidHomeState();
}

class _MetroidHomeState extends State<MetroidHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Metroid Prime Item Tracker"),
      ),
    );
  }
}

