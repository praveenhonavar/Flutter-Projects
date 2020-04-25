import 'dart:convert';
import 'dart:io';
import 'package:flutter_ml/nutridetails.dart';
import 'package:flutter_ml/read.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int c;

  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      c = prefs.getInt('counter') ?? 0;
      print(c);
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  var url =
      'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=DEMO_KEY&query=';

  File pickedImage;

  bool img = false;

  bool txt = false;
  bool isLoaded = false;
  VisionText vt;
  TextBlock block;
  int currentIndex = 1;

  pickImage() async {
    var temp = await ImagePicker.pickImage(source: ImageSource.camera);

    temp == null
        ? pickedImage =
            File('android\app\src\main\res\mipmap-mdpi\ic_launcher.png')
        : readText();
    setState(
      () {
        try {
          pickedImage = temp;
          img = true;
        } catch (e) {
          print(e);
        }
      },
    );
  }

  chooseImage() async {
    var temp = await ImagePicker.pickImage(source: ImageSource.gallery);

    temp == null
        ? pickedImage =
            File('android\app\src\main\res\mipmap-mdpi\ic_launcher.png')
        : setState(
            () {
              try {
                pickedImage = temp;
                img = true;
                readText();
              } catch (e) {
                img = false;
                print(e);
              }
              // temp == null ? : pickedImage = temp;
              // img = true;
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

  getNutri(VisionText data) async {
    img = false;
    var res = await get(url + data.text);
    var detail = jsonDecode(res.body);

    print('ddddddd' + detail.toString());

    Nutridetails nutri = Nutridetails.fromJson(detail);

    Foods f = nutri.foods[0];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Read(),
        settings: RouteSettings(arguments: f),
      ),
    );

    int len = f.foodNutrients.length;
    if (len == 0) {
      print('ggggg');
    } else {
      for (int i = 0; i < len; i++) {
        print('innnnnn');
        String k = f.foodNutrients[i].nutrientName;
        //print(k);

        if (k == 'Protein') {
          print(i);
          protein = i;
        } else if (k == "Carbohydrate, by difference") {
          print(i);
          carbo = i;
        } else if (k == "Carbohydrate, by difference") {
          print(i);
          carbo = i;
        } else if (k == 'Energy') {
          print(i);
          energy = i;
        } else {
          continue;
        }

        //pobj = f.foodNutrients[protein];
        // print(fobj.nutrientName);

      }
    }

    //FoodNutrients fobj = new FoodNutrients.fromJson(f.toJson());

    //print(fobj.nutrientId);

    setState(() {
      Foods f = nutri.foods[0];

      pobj = f.foodNutrients[protein];
      cobj = f.foodNutrients[carbo];
      eobj = f.foodNutrients[energy];

      print(pobj.nutrientName);

      isLoaded = true;
    });
  }

  chooseScreen() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Choose from gallery',
                    ),
                    onTap: chooseImage,
                  ),
                  GestureDetector(
                    child: Text(
                      'Open Camera',
                    ),
                    onTap: pickImage,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // var counter = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
        centerTitle: true,
        title: Text(
          'NutriScan',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                    // SizedBox(
                    //   height: 50,
                    // ),
                    GestureDetector(
                      //onTap: () => ,
                      child: RaisedButton(
                          onPressed: () => getNutri(vt),
                          child: Icon(Icons.add)),
                      //   child: FlatButton(
                      //     child: Icon(
                      //       Icons.arrow_forward_ios,
                      //     ),
                      //     // onPressed: () => txt
                      //     //     ? Navigator.push(
                      //     //         context,
                      //     //         MaterialPageRoute(
                      //     //           builder: (context) => Read(),
                      //     //           settings: RouteSettings(
                      //     //             arguments: (
                      //     //               pobj,eobj,cobj
                      //     //             ),
                      //     //           ),
                      //     //         ),
                      //           )
                      //         : Text('WAitt'),
                      //   ),
                      // ),
                    ),
                  ],
                )
              : Center(
                  child: CircularStepProgressIndicator(
                    child: Text(
                      'CAl$c',
                    ),
                    totalSteps: 2500,
                    currentStep: 1000,
                    stepSize: 10,
                    selectedColor: Colors.greenAccent,
                    unselectedColor: Colors.grey[200],
                    padding: 0,
                    width: 150,
                    height: 150,
                    selectedStepSize: 15,
                  ),
                ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            title: Text(
              'Search',
            ),
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            title: Text(
              'Read Food',
            ),
            icon: InkWell(
              onTap: () {
                chooseScreen();
              },
              child: Icon(
                Icons.camera_alt,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            title: Text(
              'Account',
            ),
            icon: InkWell(
              child: Icon(
                Icons.person,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
