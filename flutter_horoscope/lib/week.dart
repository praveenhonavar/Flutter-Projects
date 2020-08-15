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
      body: Center(
        child: Container(
          child:Text(
            data,
          ),
        ),
      ),
    );
  }
}