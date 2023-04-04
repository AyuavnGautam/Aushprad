import 'dart:io';
import 'package:anveshana/pages/firebase_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CameraGal extends StatefulWidget {
  const CameraGal({Key? key}) : super(key: key);

  @override
  State<CameraGal> createState() => _CameraGalState();
}

class _CameraGalState extends State<CameraGal> {
  File? image;

  Future pickImageGal() async{
    try{
      ImagePicker picker= ImagePicker();
      final image= await picker.getImage(source: ImageSource.gallery);

      if(image==null) return;
      final imageTemp= File(image.path);
      final filename = basename(imageTemp.path);
      final destination = 'files/$filename';
      FirebaseApi.uploadFile(destination, imageTemp);
      setState(() => this.image =imageTemp);

    } on PlatformException catch(e){
      print('Failed to pick Image: $e');
    }
  }
  Future pickImageCam() async{
    try{
      ImagePicker picker= ImagePicker();
      final image= await picker.getImage(source: ImageSource.camera);

      if(image==null) return;
      final imageTemp= File(image.path);

      setState(() => this.image =imageTemp);

    } on PlatformException catch(e){
      print('Failed to pick Image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Scanner'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(

            children: <Widget>[
              MaterialButton(
                  color: Colors.red[400],
                  child: Text('Upload from Gallery'),
                  onPressed: (){
                    pickImageGal();
                  }
              ),
            MaterialButton(
            color: Color.fromRGBO(137, 244, 255, 1.0),
                child: Text('Upload from Camera'),
                  onPressed: (){
                  pickImageCam();
          }),
              SizedBox(height:20,),
              image!= null? Image.file(image!): Text('No Image Selected'),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(onPressed: () {  Navigator.pushNamed(context, '/next');},
        label:Text('Next'),
      ),
    );
  }
}
