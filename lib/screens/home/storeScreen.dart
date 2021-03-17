import 'package:Store/screens/admin/vegetablesAdmin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../sharedWidgets/drawerScreen.dart';
import 'package:Store/screens/tabItem.dart';

import 'homeScreen.dart';

class StoreHomePage extends StatefulWidget {
  StoreHomePage({Key key, this.user}) : super(key: key);
  final User user;

  @override
  _StoreHomePageState createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  final tabs = ['Home', 'Admin', 'Help', 'Settings'];
  int selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return DrawerScreen(
        user: widget.user,
        child: HomeScreen(user: widget.user)
    );
  }

  _buildBottomTab() {
    return BottomAppBar(
      color: Colors.amber[200],
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(text: tabs[0], icon: Icons.home, isSelected: selectedPosition == 0, onTap: () {
            setState(() {
              selectedPosition = 0;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (HomeScreen())),
              );
            });
          },),
          TabItem(text: tabs[1], icon: Icons.person, isSelected: selectedPosition == 1, onTap: () {
            setState(() {
              selectedPosition = 1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (VegetablesAdminForm())),
              );
            });
          },),
          SizedBox(width: 48,),
          TabItem(text: tabs[2], icon: Icons.help, isSelected: selectedPosition == 2, onTap: () {
            setState(() {
              selectedPosition = 2;
            });
          },),
          TabItem(text: tabs[3], icon: Icons.settings, isSelected: selectedPosition == 3, onTap: () {
            setState(() {
              selectedPosition = 3;
            });
          },),
        ],
      ),
    );
  }
}
