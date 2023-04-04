import 'package:anveshana/doctor/bmwmap.dart';
import 'package:anveshana/doctor/logindoc.dart';
import 'package:flutter/material.dart';
import 'package:anveshana/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:anveshana/doctor/docCamera.dart';

class DocHomeScreen extends StatefulWidget {
  const DocHomeScreen({Key? key}) : super(key: key);

  @override
  State<DocHomeScreen> createState() => _DocHomeScreenState();
}

class _DocHomeScreenState extends State<DocHomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance.collection("doctors")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),

                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Welcome!',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 36.0,

                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text("${loggedInUser.firstname} ${loggedInUser.secondName}",
                          style: TextStyle(
                            fontSize: 18.0,

                          ),
                        ),
                      ],
                    ),
                  ))
          ),
          SizedBox(height: 20,),

          Center(
              child: Column(

                children: <Widget>[
                  ElevatedButton(
                    onPressed: ()
                    {Navigator.pushNamed(context, '/bmw');},

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(365,85),
                      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)
                      ),
                      backgroundColor: const Color.fromRGBO(218, 248, 255, 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          child: Image.asset('assets/1.png',
                            scale: 0.2,),

                        ),
                        SizedBox(width: 40,),
                        Text('BMW COLLECTOR',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: ()
                    {Navigator.pushNamed(context, '/doccam');
                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(365,85),
                      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)
                      ),
                      backgroundColor: Color.fromRGBO(255, 234, 230, 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          child: Image.asset('assets/Biohazard.png',
                            scale: 0.1,),

                        ),

                        SizedBox(width: 40,),
                        Text('MEDICAL WASTE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),),

                      ],
                    ),
                  ),
                  SizedBox(height: 115,),
                  SizedBox(
                    child: Image.asset('assets/fontisto_doctor.png',
                      scale: 1,),

                  ),
                ]
                , )
          ),



        ]
        ,),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () { logout(context); },

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
              IconButton(onPressed: (){},

                icon: Icon(Icons.home_filled,
                  size: 35,),
              ),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/bmw');},
                icon: Icon(Icons.map,
                  size: 35,),
              ),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/doccam');},
                icon: Icon(Icons.camera,
                  size: 35,
                ),
              ),
            ],),),
      ),


    );
  }


  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DoctorScreen()));
  }
}