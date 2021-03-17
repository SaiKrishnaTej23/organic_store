import 'package:Store/screens/admin/vegetablesAdmin.dart';
import 'package:Store/screens/pages/CartPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Store/constants/constants.dart';
import 'package:Store/screens/tabItem.dart';
import 'package:Store/screens/home/homeScreen.dart';

class DrawerScreen extends StatefulWidget {
  Widget child;

  DrawerScreen({Key key, this.user, @required this.child}) : super(key: key);
  final User user;

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final tabs = ['Home', 'Admin', 'Help', 'Settings'];
  int selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartPage();
                },
              ),
            );
          },
          child: Icon(Icons.shopping_cart),
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          clipBehavior: Clip.hardEdge,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: _buildBottomTab(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: primaryColor,
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi ' + widget.user.displayName + '!',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        IconButton(icon: Icon(Icons.settings), onPressed: null)
                      ],
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
              ),
            ),
            widget.child
          ],
        ));
  }

  _buildBottomTab() {
    return BottomAppBar(
      color: primaryColor,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
            text: tabs[0],
            icon: Icons.home,
            isSelected: selectedPosition == 0,
            onTap: () {
              setState(() {
                selectedPosition = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (HomeScreen())),
                );
              });
            },
          ),
          TabItem(
            text: tabs[1],
            icon: Icons.person,
            isSelected: selectedPosition == 1,
            onTap: () {
              setState(() {
                selectedPosition = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (VegetablesAdminForm())),
                );
              });
            },
          ),
          SizedBox(
            width: 48,
          ),
          TabItem(
            text: tabs[2],
            icon: Icons.help,
            isSelected: selectedPosition == 2,
            onTap: () {
              setState(() {
                selectedPosition = 2;
              });
            },
          ),
          TabItem(
            text: tabs[3],
            icon: Icons.settings,
            isSelected: selectedPosition == 3,
            onTap: () {
              setState(() {
                selectedPosition = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}
