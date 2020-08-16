import 'package:flutter/material.dart';

class Week extends StatefulWidget {
  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {
  @override
  Widget build(BuildContext context) {
    String data=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
            child: Container(
              height: 450,
              // color: Colors.blueGrey,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    data,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}