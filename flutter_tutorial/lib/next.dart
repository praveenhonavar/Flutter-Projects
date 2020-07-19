import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second',
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Lottie.asset('assests/ponu.json'),
          ],
        ),
      ),
    );
  }
}
