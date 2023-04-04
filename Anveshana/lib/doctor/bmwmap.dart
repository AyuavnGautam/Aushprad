import 'package:anveshana/doctor/docCamera.dart';
import 'package:anveshana/doctor/logindoc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BMapTracker extends StatefulWidget {
  const BMapTracker({Key? key}) : super(key: key);

  @override
  State<BMapTracker> createState() => _BMapTrackerState();
}

class _BMapTrackerState extends State<BMapTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/bmw collector.jpg"),
    fit: BoxFit.cover,

    ),
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {  },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(360,70),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)
            ),
            backgroundColor: Color.fromRGBO(33, 40, 82, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(onPressed: (){Navigator.pushNamed(context, '/dochome');},

                icon: Icon(Icons.home_filled,
                  size: 35,),
              ),
              IconButton(onPressed: (){},
                icon: Icon(Icons.map,
                  size: 35,),
              ),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/doccam');},
                icon: Icon(Icons.camera,
                  size: 35,
                ),
              ),
            ],),),
      ),),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
      label: Text('Nearby BMW Collector'),),
    );

  }
}
