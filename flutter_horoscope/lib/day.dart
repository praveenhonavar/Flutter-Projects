import 'package:flutter/material.dart';

class Day extends StatefulWidget {
  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
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