import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance; //devlopers
  final GoogleSignIn googleSignIn = GoogleSignIn(); //to use google sigin

  Future<FirebaseUser> gsignIn() async {

    GoogleSignInAccount googleSignInAccount = 
        await googleSignIn.signIn();       // google Sign account as all details in devices emails 

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;           // has cerdinatlites

    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    print(user.displayName);

    print(user.phoneNumber);

    return user;
  }

  void signOutGoogle() {
    googleSignIn.signOut();
    print("signed out");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SignIn',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyApp obj = new MyApp();
 

  @override
  Widget build(BuildContext context) {
   
     AppBar(
       
        title: Text(widget.title),
      );

       Center(
       
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: () => obj.gsignIn(),
              icon: Icon(
                Icons.mail,
              ),
              label: Text(
                "Signin",
              ),
            ),
            RaisedButton.icon(
              onPressed: () {
                obj.signOutGoogle();
              },
              icon: Icon(
                Icons.mail,
              ),
              label: Text(
                "SignOut",
              ),
            ),
          ],
        ),
      );
      return MyApp();
  }
}
