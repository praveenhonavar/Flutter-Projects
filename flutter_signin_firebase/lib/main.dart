import 'package:flutter/material.dart';
import 'next.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class Fuser {
  var uname;
  var img;
  var mail;
  Fuser(this.uname, this.img, this.mail);
}

//Fuser fobj = new Fuser(uname, img, mail)
Fuser fobj;

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future signIn() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential authCredential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken,
  );

  final AuthResult authResult =
      await firebaseAuth.signInWithCredential(authCredential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await firebaseAuth.currentUser();
  assert(user.uid == currentUser.uid);

  fobj = Fuser(user.displayName, user.photoUrl, user.email);

  print(fobj.uname);

  return 'signInWithGoogle succeeded: $user';
}

Future signOut() async {
  await googleSignIn.signOut();
  print('Signout');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Flutter Firebase',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: OutlineButton(
          onPressed: () => signIn().whenComplete(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Next(),
                  settings: RouteSettings(
                    arguments: fobj,
                  ),
                ),
              );
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: Text(
            'Signin with google',
          ),
        ),
      ),
    );
  }
}
