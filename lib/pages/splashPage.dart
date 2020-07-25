import 'package:flutter/material.dart';
import 'package:nessa_kitchen/pages/homepage.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "/";
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
          child: TextField(
            decoration: InputDecoration(fillColor: Colors.grey, filled: true),
          )),
      floatingActionButton: RaisedButton.icon(
        onPressed: () => context.nav.pushReplacementNamed(HomePage.routeName),
        icon: Icon(Icons.whatshot),
        label: Text("See What's Cooking"),
      ),
      // floatingActionButtonLocation: ,
    );
  }
}
