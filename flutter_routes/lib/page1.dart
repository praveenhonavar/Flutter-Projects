import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GOOOOOO"),
      ),
      body: Container(
        child: FlatButton(
          onPressed: () => Navigator.pushNamed(context, 'page2'),
          child: Text(
            "PSUH",
          ),
          //icon: null,
          //label: Text(
          // 'Push',
        ),
      ),
    );
  }
}
