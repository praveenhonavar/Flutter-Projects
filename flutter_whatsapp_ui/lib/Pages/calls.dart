import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "KAVEEN",
            ),
            subtitle: Text(
              '1109240611169',
            ),
            leading: CircleAvatar(
              child: Text(
                'KP',
              ),
            ),
            trailing: Icon(
              Icons.call,
              color: Color(0xFF128c7e),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.add_call,
        ),
        backgroundColor: Color(0xFF25d366),
      ),
    );
  }
}
