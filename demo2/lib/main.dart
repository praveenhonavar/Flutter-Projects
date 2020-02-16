import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "HELLOO",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  color: Colors.blue,
                ),
                Expanded(
                  child: Container(
                    child: Text("KP"),
                    padding: EdgeInsets.all(20),
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text("PD"),
                  padding: EdgeInsets.all(20),
                  color: Colors.brown,
                ),
                Expanded(child: Image.asset("assets/spc1.jpg")),
                Container(
                  child: Text(
                    "Helllooo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text("PD"),
                padding: EdgeInsets.all(20),
                color: Colors.brown,
              ),
              Container(
                child: Text(
                  "Helllooo",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(20),
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("CLick"),
        backgroundColor: Colors.cyanAccent,
      ),
    );
  }
}
