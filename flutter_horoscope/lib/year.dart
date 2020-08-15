import 'package:flutter/Material.dart';

class Year extends StatefulWidget {
  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
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