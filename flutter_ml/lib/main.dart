//import 'dart:io';
//import 'dart:js';

//import 'dart:js';



import 'package:flutter/material.dart';
import 'package:flutter_ml/loader.dart';
import 'package:flutter_ml/mainPage.dart';
import 'package:flutter_ml/read.dart';
import 'package:flutter_ml/splashscreen.dart';
//import 'package:flutter_ml/read.dart';
//import 'package:image_picker/image_picker.dart';

//import 'package:firebase_ml_vision/firebase_ml_vision.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        initialRoute: 's',
        routes: {
          'h': (context) => HomePage(),
          'r': (context) => Read(),
          'l':(context) => Load(),
          's':(context)=>Splash(),
        },
      ),
    );
