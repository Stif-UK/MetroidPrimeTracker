import 'package:flutter/material.dart';

class MetroidHome extends StatefulWidget {
  const MetroidHome({Key? key}) : super(key: key);

  @override
  State<MetroidHome> createState() => _MetroidHomeState();
}

class _MetroidHomeState extends State<MetroidHome> {
  var _checked = false;
  var _checked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Metroid Prime Item Tracker"),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: const Text("Gravity Chamber"),
            subtitle: const Text("Energy Tank"),
            secondary: const Icon(Icons.electric_bolt),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked,
            onChanged: (bool? value){
              setState(() {
                _checked = value!;
              });
            }

          ),
          CheckboxListTile(
              title: const Text("Life Grove"),
              subtitle: const Text("Missile Expansion"),
              secondary: const Icon(Icons.ac_unit),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked2,
              onChanged: (bool? value){
                setState(() {
                  _checked = value!;
                });
              }

          ),
        ],
      ),
    );
  }
}

