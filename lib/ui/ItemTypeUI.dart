import 'package:flutter/material.dart';

class ItemsTypeUI extends StatefulWidget {
  const ItemsTypeUI({Key? key}) : super(key: key);

  @override
  State<ItemsTypeUI> createState() => _ItemsTypeUIState();
}

class _ItemsTypeUIState extends State<ItemsTypeUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        //Button 1: Missile Upgrades
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: (){},
              //onPressed: (){ Get.to(() => WearStats());},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.black)
                      )

                  )
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Missile Upgrades",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: 0.1,),
                )),
            Text("10%")
          ],
        ),
        const Divider(thickness: 4,),

        //Button 2: Energy Tanks
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: (){},
              //onPressed: (){ Get.to(() => WearStats());},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.black)
                      )

                  )
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Energy Tanks",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: 0.25,),
                )),
            Text("25%")
          ],
        ),
        const Divider(thickness: 4,),

        //Button 3: Power Bombs
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: (){},
              //onPressed: (){ Get.to(() => WearStats());},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.black)
                      )

                  )
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Power Bombs",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: 0.7,),
                )),
            Text("70%")
          ],
        ),
        const Divider(thickness: 4,),


        //Button 4: Artefacts
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: (){},
              //onPressed: (){ Get.to(() => WearStats());},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.black)
                      )

                  )
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Artefacts",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: 0.33,),
                )),
            Text("33%")
          ],
        ),
        const Divider(thickness: 4,),


        //Button 5: Upgrades
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: (){},
              //onPressed: (){ Get.to(() => WearStats());},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.black)
                      )

                  )
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Upgrades",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              )
          ),
        ),
        Row(
          children: [
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: 0.92,),
                )),
            Text("92%")
          ],
        ),
        const Divider(thickness: 4,),


      ],

    );
  }
}
