import 'package:anveshana/collector/colhome.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CBMapTrackerP extends StatefulWidget {
  const CBMapTrackerP({Key? key}) : super(key: key);

  @override
  State<CBMapTrackerP> createState() => _CBMapTrackerPState();
}

class _CBMapTrackerPState extends State<CBMapTrackerP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/pharmacy.jpg"),
    fit: BoxFit.cover,

    ),
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color.fromRGBO(232, 178, 73, 1),
        child:
              IconButton(onPressed: (){Navigator.pushNamed(context, '/colhome');},

                icon: Icon(Icons.home_filled,
                  size: 35,),
              ),


            ),
      ),),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
      label: Text('Nearby Pharmacies'),),
    );

  }
}
