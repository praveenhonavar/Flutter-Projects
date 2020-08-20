import 'package:flutter/material.dart';

class Day extends StatefulWidget {
  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context).settings.arguments;
    // print(data)

    var curntDate = DateTime.now();
    String dd = curntDate.day.toString();
    String mm = curntDate.month.toString();
    // var newFormat = DateFormat("dd-MM-yy");

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF29323C), Color(0xFF485563)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Heres your horoscope for',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$dd-$mm',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
              child: Container(
                height: 450,
                // color: Colors.blueGrey,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  gradient: LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFF434343)],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      data,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
