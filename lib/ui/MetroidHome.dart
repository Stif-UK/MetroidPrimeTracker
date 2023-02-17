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
          const SizedBox(height: 20),

          //Button 1: Tallon Overworld
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
                  child: Text("Tallon Overworld",
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
            child: LinearProgressIndicator(value: 0.5,),
          )),
              Text("50%")
            ],
          ),
          const Divider(thickness: 4,),

          //Button 2: Chozo Ruins
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
                  child: Text("Chozo Ruins",
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
                    child: LinearProgressIndicator(value: 0.3,),
                  )),
              Text("30%")
            ],
          ),
          const Divider(thickness: 4,),

          //Button 3: Magmoor Caverns
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
                  child: Text("Magmoor Caverns",
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
                    child: LinearProgressIndicator(value: 0.2,),
                  )),
              Text("20%")
            ],
          ),
          const Divider(thickness: 4,),


      //Button 4: Phendrana Drifts
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
                  child: Text("Phendrana Drifts",
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
                    child: LinearProgressIndicator(value: 0.6,),
                  )),
              Text("60%")
            ],
          ),
          const Divider(thickness: 4,),


          //Button 5: Phazon Mines
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
                  child: Text("Phazon Mines",
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
                    child: LinearProgressIndicator(value: 0.9,),
                  )),
              Text("90%")
            ],
          ),
          const Divider(thickness: 4,),


        ],

      ),
    );
  }
}

