//import 'dart:convert';
//import 'dart:js';

//import 'package:flutter_ml/mainPage.dart';
//import 'package:flutter_ml/main.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

//import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'package:flutter_ml/nutridetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainPage.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

FoodNutrients pobj;
FoodNutrients cobj;
FoodNutrients eobj;

int protein;
int carbo;
int fats;
int energy;

class _ReadState extends State<Read> {
  bool isLoaded = true;

  HomePage homePage = new HomePage();
  int counter = 0;

  var url =
      'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=DEMO_KEY&query=';

  @override
  void initState() {
    super.initState();
    loadCounter();
    //getNutri(data);
  }

  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        counter = prefs.getInt('counter') ?? 0;
      },
    );
  }

  addCounter(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      counter = (prefs.getInt('counter') ?? 0) + int.parse(eobj.nutrientNumber);
      prefs.setInt('counter', counter);
    });

    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
        settings: RouteSettings(arguments: counter),
      ),
    );
  }

  remove(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.remove('counter');
      loadCounter();
    });

    //Navigator.pop(context);
    //Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
        settings: RouteSettings(arguments: counter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Foods f = ModalRoute.of(context).settings.arguments;
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
      pobj = f.foodNutrients[protein];
      cobj = f.foodNutrients[carbo];
      eobj = f.foodNutrients[energy];
      isLoaded = true;
    });

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isLoaded
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              'Protiens:${pobj.nutrientNumber} ${pobj.unitName}'),
                          Text(
                              'Carbhohydrates:${cobj.nutrientNumber} ${cobj.unitName}'),
                          Text(
                              'Energy:${eobj.nutrientNumber}  ${eobj.unitName}'),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircularStepProgressIndicator(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'CAL',
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      eobj.nutrientNumber,
                                    ),
                                  ],
                                ),
                                totalSteps: 550,
                                currentStep: int.parse(eobj.nutrientNumber),
                                stepSize: 10,
                                selectedColor: Colors.greenAccent,
                                unselectedColor: Colors.grey[200],
                                padding: 0,
                                width: 100,
                                height: 100,
                                selectedStepSize: 15,
                              ),
                              CircularStepProgressIndicator(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'PROT',
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      pobj.nutrientNumber,
                                    ),
                                  ],
                                ),
                                totalSteps: 300,
                                currentStep: int.parse(eobj.nutrientNumber),
                                stepSize: 10,
                                selectedColor: Colors.greenAccent,
                                unselectedColor: Colors.grey[200],
                                padding: 0,
                                width: 100,
                                height: 100,
                                selectedStepSize: 15,
                              ),
                              CircularStepProgressIndicator(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'CARBS',
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      cobj.nutrientNumber,
                                    ),
                                  ],
                                ),
                                totalSteps: 500,
                                currentStep: int.parse(cobj.nutrientNumber),
                                stepSize: 10,
                                selectedColor: Colors.greenAccent,
                                unselectedColor: Colors.grey[200],
                                padding: 0,
                                width: 100,
                                height: 100,
                                selectedStepSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 250,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    heroTag: 'remove',
                                    backgroundColor: Colors.red,
                                    onPressed: () =>
                                        Navigator.popAndPushNamed(context, 'h'),
                                    child: Icon(
                                      Icons.clear,
                                      semanticLabel: 'Dont Add',
                                    ),
                                  ),
                                  FloatingActionButton(
                                    heroTag: 'add',
                                    backgroundColor: Colors.green,
                                    onPressed: () => addCounter(context),
                                    child: Icon(
                                      Icons.done,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    : Text(
                        'Laoding',
                      ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
