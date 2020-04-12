import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(
      new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: new HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter JSON"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json_data/person.json'),
            builder: (context, snapshot) {
              var mydata = jsonDecode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          mydata[index]['name'],
                        ),
                        Text(
                          mydata[index]['age'],
                        ),
                        Text(
                          mydata[index]['gender'],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
