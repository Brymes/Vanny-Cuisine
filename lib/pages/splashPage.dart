import 'package:flutter/material.dart';
import 'package:vanny_cuisine/pages/homepage.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //boolAuth Variables
  // MobFirebaseAuth.FirebaseAuth mobAuth = MobFirebaseAuth.FirebaseAuth.instance;
  // final GoogleSignIn mobGoogleSignIn = GoogleSignIn();
  // MobFirebaseAuth.FirebaseUser firebaseUser;

  //To Check if User is Logged in
  // Future boolAuth() async {
  //   if (mobAuth != null && (await mobGoogleSignIn.isSignedIn())) {
  //     firebaseUser = await mobAuth.currentUser();
  //   } else {
  //     //User is not logged in, take them to the signin Screen
  //     Navigator.of(context).pushNamed(HomePage.routeName);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("vanny_logo.jpeg"), fit: BoxFit.cover)),
          //TODO edit to remove this text field
          child: TextField(
            decoration: InputDecoration(fillColor: Colors.grey, filled: true),
          )),
      floatingActionButton: RaisedButton.icon(
        onPressed: () => {Navigator.of(context).pushNamed(HomePage.routeName)},
        icon: Icon(Icons.whatshot),
        label: Text("See What's Cooking"),
      ),
      // /floatingActionButtonLocation: ,
    );
  }
}
