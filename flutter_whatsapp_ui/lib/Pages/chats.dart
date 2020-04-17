import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "KAVEEN",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Unos',
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  'KP',
                ),
              ),
              trailing: Text(
                '24/11/20',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "PD",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Unop',
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  'P',
                ),
              ),
              trailing: Text(
                '11/09/20',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "KP",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Unop',
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  'K',
                ),
              ),
              trailing: Text(
                '24/06/20',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF25d366),
          child: Icon(
            Icons.message,
          ),
          onPressed: null),
    );
  }
}
