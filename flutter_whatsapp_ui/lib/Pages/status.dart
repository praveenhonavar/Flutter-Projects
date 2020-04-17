import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        title: Text(
          "My status",
        ),
        subtitle: Text(
          'Tap to add status update',
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: null,
      backgroundColor: Color(0xFF25d366),
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
