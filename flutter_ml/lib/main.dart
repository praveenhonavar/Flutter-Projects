import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ml/read.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url='https://api.nal.usda.gov/fdc/v1/foods/search?api_key=DEMO_KEY&query=';


  File pickedImage;
  bool img = false;
  bool txt = false;
  VisionText vt;
  TextBlock block;

  pickImage() async {
    var temp = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(
      () {
        pickedImage = temp;
        img = true;
      },
    );
  }

  chooseImage() async {
    var temp = await ImagePicker.pickImage(source: ImageSource.gallery);

    if(temp==null){
      img=false;
    }

    setState(
      () {
        pickedImage = temp;
        img = true;
      },
    );
  }

  readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText readText = await textRecognizer.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
      print(block.text);

      setState(() {
        txt = true;
        vt = readText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.camera_alt),
                label: Text(
                  'Take a Pic',
                ),
                onPressed: pickImage,
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.perm_media),
                label: Text(
                  'Choose a Pic',
                ),
                onPressed: chooseImage,
              ),
            ],
          ),
          img
              ? Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(pickedImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Icon(
                    Icons.image,
                    size: 50,
                  ),
                ),
          SizedBox(
            height: 30,
          ),
          RaisedButton.icon(
            icon: Icon(Icons.library_books),
            label: Text(
              'Read',
            ),
            onPressed: readText,
          ),
          SizedBox(
            height: 50,
          ),
          FlatButton(
            child: Icon(
              Icons.arrow_forward_ios,
            ),
            onLongPress: () => HomePage(),
            onPressed: () => txt
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Read(),
                      settings: RouteSettings(
                        arguments: vt,
                      ),
                    ),
                  )
                  
                : Text('WAitt'),
          ),
        ],


      ),
    );
  }
}
