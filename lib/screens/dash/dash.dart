import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Store/constants/constants.dart';
import 'package:Store/models/toDo.dart';

class DashScreen extends StatefulWidget {
  DashScreen({Key key, this.user}) : super(key: key);
  final User user;

  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen>
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
    List<ThingsToDo> values = thingsTo;
    print(thingsTo);
    return AnimatedContainer(
      transform: Matrix4.translationValues(offsetX, offsetY, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              isDrawerOpen ? Radius.elliptical(20, 20) : Radius.zero)),
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IconButton(
                  //   icon: Icon(isDrawerOpen
                  //       ? Icons.menu_open_outlined
                  //       : Icons.menu_outlined),
                  //   onPressed: () {
                  //     this.setState(() {
                  //       offsetX = isDrawerOpen ? 0 : 200;
                  //       offsetY = isDrawerOpen ? 0 : 150;
                  //       scaleFactor = isDrawerOpen ? 1 : 0.7;
                  //       isDrawerOpen = !isDrawerOpen;
                  //     });
                  //   },
                  // ),
                  Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Sailu Fitness'.toUpperCase(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'get fit like sailu'.toUpperCase(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoURL),
                    )
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'THINGS TO DO',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTime.now().toString().substring(0, 10),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_sharp),
                            color: Colors.blue,
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios_sharp),
                            color: Colors.blue,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    child: new ListView(
                      primary: false,
                      shrinkWrap: true,
                      children: values.map((ThingsToDo key) {
                        return new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: new Text(key.taskName),
                          subtitle: new Text(key.status),
                          value: key.selected,
                          onChanged: (bool value) {
                            setState(() {
                              key.selected = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MY PROGRESS',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                    )
                  ],
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey[100]),
                        child: SizedBox(height: 1,width: 1,),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey[100]),
                        child: SizedBox(height: 1,width: 1,),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey[100]),
                        child: SizedBox(height: 1,width: 1,),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
