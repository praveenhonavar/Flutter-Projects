import 'package:flutter/material.dart';

class Month extends StatefulWidget {
  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends State<Month> {
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