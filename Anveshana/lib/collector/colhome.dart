import 'package:anveshana/collector/logincol.dart';
import 'package:flutter/material.dart';
import 'package:anveshana/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ColHomeScreen extends StatefulWidget {
  const ColHomeScreen({Key? key}) : super(key: key);

  @override
  State<ColHomeScreen> createState() => _ColHomeScreenState();
}

class _ColHomeScreenState extends State<ColHomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance.collection("Collector")
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
                  Text('Hi there!',
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
                      {Navigator.pushNamed(context, '/colmap');
                      },

                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(365,85),
                        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)
                        ),
                        backgroundColor: const Color.fromRGBO(
                            230, 218, 255, 1.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/group.png',
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
                      {Navigator.pushNamed(context, '/colmapphar');
                      },

                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(365,85),
                        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)
                        ),
                        backgroundColor: Color.fromRGBO(247, 252, 217, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                                child: Image.asset('assets/group_0.png',
                                scale: 0.1,),

                                    ),

                          SizedBox(width: 40,),
                          Text('PHARMACY',
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
                      child: Image.asset('assets/group_1.png',
                        scale: 3.3,),

                    ),
                ]
                 , )
                    ),



        ]
        ,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () { logout(context); },
    style: ElevatedButton.styleFrom(

    backgroundColor: Color.fromRGBO(232, 178, 73, 1),
    ),
          child: Icon(Icons.logout),


      ),



    );
  }


Future<void> logout(BuildContext context) async
{
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CollectorScreen()));
}
}