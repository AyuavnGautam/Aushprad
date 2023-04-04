import 'dart:io';
import 'package:flutter/src/rendering/box.dart';
import 'package:anveshana/pages/map%20trackerpharmacy.dart';
import 'package:flutter/material.dart';

class UnusedMed extends StatefulWidget {
  const UnusedMed({Key? key}) : super(key: key);

  @override
  State<UnusedMed> createState() => _UnusedMedState();
}

class _UnusedMedState extends State<UnusedMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

          children:<Widget>[
            Expanded(
              child: Column(
          children:<Widget>[
            SafeArea(
              child: const Center(child: Text('Unused Medicine Details',
              style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold,),)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 30, 8, 0),
              child: Text('Medicine detail')),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(8, 2, 8, 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Medicine Name',
                  ),
                ),
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 10, 8, 0),
                  child: Text('Quantity')),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 2, 8, 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Number of tablets',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 10, 8, 0),
                  child: Text('Salt Details')),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 2, 8, 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Optional- Enter Salt Details',
                ),
              ),
            ),
          ], ),
            ), ],),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(onPressed: (){ Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const PMapTracker()));},
        label:const Text('Find nearby Pharmacy'),
        ),
      ),

    );
  }
}
