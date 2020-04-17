import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child:CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assests/KP.jpg',
              ),
            ),
          ),   
        ],
      ),
    );
  }
}