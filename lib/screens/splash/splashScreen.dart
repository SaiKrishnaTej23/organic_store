import 'package:Store/constants/constants.dart';
import 'package:Store/screens/root/root.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.white,
      title: new Text('Organic Store',textScaleFactor: 2,),
      image: new Image.asset(
          'assets/images/logo.png'
      ),
      loadingText: Text("Loading"),
      photoSize: 150.0,
      loaderColor: primaryColor,
    );
  }
}