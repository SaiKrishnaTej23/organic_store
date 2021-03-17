import 'package:Store/screens/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Store/constants/constants.dart';

import 'components/categoriesWidget.dart';
import 'components/dailyPromoWidget.dart';
import 'components/searchStore.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.user}) : super(key: key);
  final User user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double offsetX = 0.0;
  double offsetY = 0.0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(offsetX, offsetY, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              isDrawerOpen ? Radius.elliptical(20, 20) : Radius.zero)),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(isDrawerOpen
                        ? Icons.menu_open_outlined
                        : Icons.menu_outlined),
                    onPressed: () {
                      this.setState(() {
                        offsetX = isDrawerOpen ? 0 : 200;
                        offsetY = isDrawerOpen ? 0 : 150;
                        scaleFactor = isDrawerOpen ? 1 : 0.7;
                        isDrawerOpen = !isDrawerOpen;
                      });
                    },
                  ),
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image(image: NetworkImage('https://ik.imagekit.io/organicstore/logo_yYPpj2H0Ku.png'),height: 30, width: 30,),
                            SizedBox(width: 5,height: 20,),
                            Text(
                              'Organic Store',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage();
                            },
                          ),
                        )
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.user.photoURL ?? ''),
                      ),
                    )
                  ]),
                ],
              ),
            ),
            SearchStore(),
            CategoriesWidget(),
            DailyPromoWidget()
          ],
        ),
      ),
    );
  }
}
