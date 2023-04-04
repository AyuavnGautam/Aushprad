import 'package:anveshana/doctor/docCamera.dart';
import 'package:anveshana/doctor/logindoc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CBMapTracker extends StatefulWidget {
  const CBMapTracker({Key? key}) : super(key: key);

  @override
  State<CBMapTracker> createState() => _CBMapTrackerState();
}

class _CBMapTrackerState extends State<CBMapTracker> {
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
        child: Container(
          color: Color.fromRGBO(232, 178, 73, 1),
          child: IconButton(onPressed: (){Navigator.pushNamed(context, '/colhome');},

                  icon: Icon(Icons.home_filled,
                    size: 35,),
                ),
        ),

      ),),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
      label: Text('Nearby BMW Collector'),),
    );

  }
}
