import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PMapTracker extends StatefulWidget {
  const PMapTracker({Key? key}) : super(key: key);

  @override
  State<PMapTracker> createState() => _PMapTrackerState();
}

class _PMapTrackerState extends State<PMapTracker> {
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
              IconButton(onPressed: (){Navigator.pushNamed(context, '/');},

                icon: Icon(Icons.home_filled,
                  size: 35,),
              ),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/map');},
                icon: Icon(Icons.map,
                  size: 35,),
              ),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/camera');},
                icon: Icon(Icons.camera,
                  size: 35,
                ),
              ),
            ],),),
      ),),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
      label: Text('Nearby Pharmacy'),),
    );

  }
}
