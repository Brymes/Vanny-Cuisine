import 'package:flutter/material.dart';
import 'package:vanny_cuisine/pages/meetVanny.dart';
import 'package:vanny_cuisine/pages/previousOrders.dart';
import 'package:vanny_cuisine/pages/userProfile.dart';
import 'package:vanny_cuisine/pages/contactUs.dart';
import 'package:vanny_cuisine/pages/cart.dart';
import 'package:vanny_cuisine/pages/dishlist.dart';
import 'package:vanny_cuisine/pages/homepage.dart';
import 'package:vanny_cuisine/pages/splashPage.dart';

//TODO Domain Name Registration

//TODO Remind nessa that she needs a domain name
//TODO ADD Space to add improvements and "DISHES" to app
//TODO ADD SEARCH FUNCTION FOR ::::: Instead add category Functionality

//TODO DO Entire Firebase Setup For IOS
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        HomePage.routeName: (context) => HomePage(),
        Dishes.routeName: (context) => Dishes(),
        ShoppingBasket.routeName: (context) => ShoppingBasket(),
        ContactUs.routeName: (context) => ContactUs(),
        UserProfile.routeName: (context) => UserProfile(),
        PreviousOrders.routeName: (context) => PreviousOrders(),
        MeetVanny.routeName: (context) => MeetVanny(),
      },
      title: 'Material App',
      // home: SplashPage(),
    );
  }
}
