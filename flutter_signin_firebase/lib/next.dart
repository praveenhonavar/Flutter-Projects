import 'package:flutter/material.dart';
import 'package:flutter_signin_firebase/main.dart';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    Fuser data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  data.img,
                ),
                radius: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Signed IN as ${data.uname}',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          OutlineButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            onPressed: () => signOut().whenComplete(() {
              Navigator.pop(context);
            }),
            icon: Icon(
              Icons.exit_to_app,
            ),
            label: Text('Signout'),
          )
        ],
      ),
    );
  }
}
