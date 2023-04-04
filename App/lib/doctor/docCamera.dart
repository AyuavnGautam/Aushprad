import 'dart:io';
import 'package:anveshana/doctor/bmwmap.dart';
import 'package:anveshana/doctor/logindoc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class DocCameraGal extends StatefulWidget {
  const DocCameraGal({Key? key}) : super(key: key);

  @override
  State<DocCameraGal> createState() => _DocCameraGalState();
}

class _DocCameraGalState extends State<DocCameraGal> {
  File? image;

  Future pickImageGal() async{
    try{
      ImagePicker picker= ImagePicker();
      final image= await picker.getImage(source: ImageSource.gallery);

      if(image==null) return;
      final imageTemp= File(image.path);

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
            fixedSize: Size(340,70),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)
            ),
            backgroundColor: Color.fromRGBO(118, 209, 182, 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(onPressed: (){Navigator.pushNamed(context, '/dochome');},

                icon: Icon(Icons.home_filled,
                  size: 35,),
              ),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/bmw');},
                icon: Icon(Icons.map,
                  size: 35,),
              ),
              IconButton(onPressed: (){},
                icon: Icon(Icons.camera,
                  size: 35,
                ),
              ),
            ],),),
      ),

    );
  }
}
