import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nessa_kitchen/pages/homepage.dart';
import 'package:nessa_kitchen/util/user_management.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email, _password, _name;
  bool _emailValidate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 25.0,
            ),
            child: Text(
              "Create an account",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          // TODO Add functionality to sign in with name and password
          //Card(
          //   elevation: 3.0,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(5.0),
          //       ),
          //     ),
          //     child: TextFormField(
          //       onChanged: (input) => _name = input,
          //       validator: (input) {
          //         if (input.isEmpty) {
          //           return 'Please Enter your Full Name';
          //         }
          //       },
          //       style: TextStyle(
          //         fontSize: 15.0,
          //         color: Colors.black,
          //       ),
          //       decoration: InputDecoration(
          //         contentPadding: EdgeInsets.all(10.0),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //           borderSide: BorderSide(
          //             color: Colors.white,
          //           ),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.white,
          //           ),
          //           borderRadius: BorderRadius.circular(5.0),
          //         ),
          //         hintText: "Full Name",
          //         prefixIcon: Icon(
          //           Icons.verified_user,
          //           color: Colors.black,
          //         ),
          //         hintStyle: TextStyle(
          //           fontSize: 15.0,
          //           color: Colors.black,
          //         ),
          //       ),
          //       maxLines: 1,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 10.0),
          Card(
            elevation: 3.0,
            child: Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextFormField(
                  onChanged: (input) => _email = input,
                  validator: (input) {
                    _emailValidate = EmailValidator.validate(input);
                    if (_emailValidate == false) {
                      return 'Please Enter a Valid Email';
                    }
                  },
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextFormField(
                onChanged: (input) => _password = input,
                validator: (input) {
                  if (input.length < 8) {
                    return 'Your Password needs to be at least 8 characters';
                  }
                },
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                obscureText: true,
                maxLines: 1,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: 50.0,
            child: RaisedButton(
              child: Text(
                "Register".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                final formState = _formKey.currentState;
                formState.save();
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((signedInUser) =>
                        UserManagement().storeNewUser(signedInUser, context))
                    .catchError((e) {
                  print(e.message);
                });
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(height: 10.0),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                children: <Widget>[
//                   RawMaterialButton(
//                     onPressed: () {},
//                     fillColor: Colors.blue[800],
//                     shape: CircleBorder(),
//                     elevation: 4.0,
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Icon(
//                         FontAwesomeIcons.facebookF,
//                         color: Colors.white,
// //              size: 24.0,
//                       ),
//                     ),
//                   ),
//                   RawMaterialButton(
//                     onPressed: () {},
//                     fillColor: Colors.white,
//                     shape: CircleBorder(),
//                     elevation: 4.0,
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Icon(
//                         FontAwesomeIcons.google,
//                         color: Colors.blue[800],
//              size: 24.0,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
