import 'package:flutter/material.dart';
import 'package:vanny_cuisine/pages/contactUs.dart';
import 'package:vanny_cuisine/pages/meetVanny.dart';
import 'package:vanny_cuisine/pages/previousOrders.dart';
import 'package:vanny_cuisine/pages/userProfile.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vanny_cuisine/pages/cart.dart';
import 'package:vanny_cuisine/widgets/animBottomNavBar.dart';
import 'package:vanny_cuisine/pages/dishlist.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    //Drawer Header to Show Current User Details
    final drawerHeader = CircleAvatar(); //TODO  add [UserAccountsDrawerHeader]

    //Top Left Drawer Items
    //TODO  Try to make the items more pretty...
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text("Recent Orders"),
          onTap: () =>
              Navigator.of(context).pushNamed(PreviousOrders.routeName),
        ),
        ListTile(
          title: Text("Meet Nessa"),
          onTap: () => Navigator.of(context).pushNamed(MeetVanny.routeName),
        ),
        ListTile(
          title: Text("Contact Us"),
          onTap: () => Navigator.of(context).pushNamed(ContactUs.routeName),
        ),
        ListTile(
          title: Text("Your Profile"),
          onTap: () => Navigator.of(context).pushNamed(UserProfile.routeName),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Nessa's Kitchen"),
      ),
      backgroundColor: Vx.gray300,

      drawer: Drawer(
        child: drawerItems,
      ),

      //List of Main Pages
      body: getPage(_currentPage),

      bottomNavigationBar: AnimatedBottomNav(
        currentIndex: _currentPage,
        onChange: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }

  getPage(int page) {
    switch (page) {
      case 0:
        return Dishes();
      case 1:
        return ShoppingBasket();
    }
  }
}
