import 'package:flutter/material.dart';
import 'package:anveshana/pages/login_screen.dart';
import 'package:anveshana/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance.collection("users")
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
          {Navigator.pushNamed(context, '/unused');
            },

          style: ElevatedButton.styleFrom(
            fixedSize: Size(365,85),
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0)
            ),
              backgroundColor: Color.fromRGBO(199, 255, 208, 1),
            ),
          child: Row(
           children: <Widget>[
             Container(
                height: 55,
               width: 55,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(100),
                 color: Color.fromRGBO(55, 255, 87, 1),

               ),
               child: Icon(
               Icons.recycling_sharp,
               size: 50,
               color: Colors.black,
             )
             ),
             SizedBox(width: 40,),
             Text('UNUSED MEDICINE',
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
               ),),

           ],
          ),
      ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: ()
            {Navigator.pushNamed(context, '/map');
            },

            style: ElevatedButton.styleFrom(
              fixedSize: Size(365,85),
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)
              ),
              backgroundColor: Color.fromRGBO(214, 229, 255, 1),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/icon_expire.png',
                 scale: 0.1,),

                ),


                SizedBox(width: 35,),
                Text('EXPIRED MEDICINE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),

              ],
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: ()
            {Navigator.pushNamed(context, '/map');
            },

            style: ElevatedButton.styleFrom(
              fixedSize: Size(365,85),
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)
              ),
              backgroundColor: Color.fromRGBO(253, 245, 224, 1),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/unrecog.png',
                    scale: 0.1,),

                ),
                SizedBox(width: 25,),
                Text('UNRECOGNISABLE MED',
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
            {Navigator.pushNamed(context, '/camera');
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
      ])),



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


    );
  }


Future<void> logout(BuildContext context) async
{
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
}