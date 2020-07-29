import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:nessa_kitchen/pages/homepage.dart';

class UserManagement {
  storeNewUser(user, context) {
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
    }).then((value) {
      Navigator.of(context).pop;
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }).catchError((e) {
      print(e.message);
    });
  }
}
