import 'package:flutter/material.dart';

class Next extends StatelessWidget {

  // void signOutGoogle() async {
  //   await googleSignIn.signOut();

  //   print("User Sign Out");
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Signed_IN'
              ),
            ),
            Center(
              child: OutlineButton(
                onPressed: (){
                  //signOutGoogle();
                }
            ),
            ),
          ],
        ),
      ),
    );
  }
}