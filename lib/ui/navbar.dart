import 'package:flutter/material.dart';
import 'package:metroid_prime_items/theme/metroid_icons_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Icon(Icons.accessibility)),
          //const SizedBox(height: 100.0,),
          ListTile(
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.privacy_tip_outlined),
            onTap: (){},
          ),
          ListTile(
            title: const Text("About App"),
            trailing: const Icon(Icons.info_outline),
            onTap: (){},
          ),
          ListTile(
            title: const Text("Attributions"),
            trailing: const Icon(Icons.check_box_outlined),
            onTap: (){},
          ),
          const SizedBox(height: 100,),
          ListTile(
            title: const Text("Reset all Data"),
            trailing: const Icon(Icons.delete_outline),
            onTap: (){},
          )
        ],
      ),
    );
  }
}
