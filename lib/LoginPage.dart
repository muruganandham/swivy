import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './HomePage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
FirebaseUser currentUser;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _text = "Please Sign In";
  Color color = Colors.black;
  String buttonTxt = "Google Sign In";

  _onLogOutCallback() {
    print("call logout..");
    _signOutGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$_text",
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              child: Text("$buttonTxt"),
              onPressed: _signInGoogle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _signInGoogle() async {
    if (currentUser != null) {
      _pushtoHome(currentUser);

      return;
    }

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);

    print(
        'signInWithGoogle succeeded: {"Welcome, ${user.displayName}. You are already signed in."}');

    _pushtoHome(user);

    setState(() {
      currentUser = user;
      _text = "Welcome, ${user.displayName}. You are already signed in.";
      buttonTxt = "Let Me In";
    });
  }

  void _signOutGoogle() async {
    _googleSignIn.signOut();
    print("User Signed out");

    setState(() {
      _text = "Please Sign In";
      buttonTxt = "Google Sign In";

      currentUser = null;
    });
  }

  void _pushtoHome(FirebaseUser fbuser) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(
              title: "Home",
              fbuser: fbuser,
              onTap: _onLogOutCallback,
            )));
  }
}
