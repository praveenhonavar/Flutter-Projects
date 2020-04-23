import 'dart:convert';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_ml/nutridetails.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

FoodNutrients fobj;
int ele;

class _ReadState extends State<Read> {
  bool isLoaded = false;

  var url =
      'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=DEMO_KEY&query=';

  getNutri(VisionText data) async {
    var res = await get(url + data.text);
    var detail = jsonDecode(res.body);

    //print('ddddddd' + detail.toString());

    Nutridetails nutri = Nutridetails.fromJson(detail);

    Foods f = nutri.foods[0];

    int len = f.foodNutrients.length;

    if(len==0 ){
      print('ggggg');
      }

    else{

      for (int i = 0; i < len; i++) {

        print('innnnnn');

        String k = f.foodNutrients[i].nutrientName;

        //print(k);

      if (k == 'Protein') {
        print(i);
        ele = i;
        break;
      }

      fobj = f.foodNutrients[ele];
      print(fobj.nutrientName);

    }
    }

    //FoodNutrients fobj = new FoodNutrients.fromJson(f.toJson());

    //print(fobj.nutrientId);

    setState(() {
      fobj = f.foodNutrients[ele];
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    VisionText data = ModalRoute.of(context).settings.arguments;

    //print(data.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Reader'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.amber,
            height: 400,
            width: 300,
            child: Column(
              children: <Widget>[
                isLoaded
                    ? Column(
                        children: <Widget>[
                          Text('Protiens:${fobj.nutrientNumber}'),
                          Text(fobj.nutrientName),
                          Text('Protiens:${fobj.unitName}'),
                          Text('Protiens:${fobj.value}'),
                        ],
                      )
                    : Text(
                        'Laoding',
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Recoganized food',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  child: Text(data.text),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton.icon(
                    onPressed: () => getNutri(data),
                    icon: Icon(
                      Icons.fastfood,
                    ),
                    label: Text(
                      'Get Nutrients',
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
