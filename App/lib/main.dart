import 'package:anveshana/collector/colhome.dart';
import 'package:anveshana/collector/colpharmamap.dart';
import 'package:anveshana/collector/logincol.dart';
import 'package:anveshana/doctor/bmwmap.dart';
import 'package:anveshana/doctor/docCamera.dart';
import 'package:anveshana/doctor/dochome.dart';
import 'package:anveshana/doctor/logindoc.dart';
import 'package:anveshana/pages/Dustbin.dart';
import 'package:anveshana/pages/login_screen.dart';
import 'package:anveshana/pages/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:anveshana/pages/home.dart';
import 'package:anveshana/pages/map tracker.dart';
import 'package:anveshana/pages/unused medicine.dart';
import 'package:anveshana/pages/Camera.dart';
import 'package:anveshana/doctor/regsiterdoc.dart';
import 'package:anveshana/collector/colbmwmap.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/dochome': (context)=> DocHomeScreen(),
      '/doccam': (context)=> DocCameraGal(),
      '/bmw': (context) => BMapTracker(),
      '/' : (context) => HomeScreen(),
      '/next': (context) => Dustbin(),
      '/docsignup':(context) => DocRegistrationScreen(),
      '/doc': (context) => DoctorScreen(),
      '/col': (context) => CollectorScreen(),
      '/colhome': (context)=> ColHomeScreen(),
      '/colmap': (context) => CBMapTracker(),
      '/colmapphar': (context) => CBMapTrackerP(),
      '/login': (context) => LoginScreen(),
      '/signup': (context) => RegistrationScreen(),
      '/home': (context) => HomeScreen(),
      '/map': (context) => MapTracker(),
      '/unused': (context)=> UnusedMed(),
      '/camera': (context) => CameraGal(),

    },
  )

  );
}

