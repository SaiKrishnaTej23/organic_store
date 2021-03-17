import 'package:Store/providers/products.dart';
import 'package:Store/providers/root.dart';
import 'package:Store/screens/splash/splashScreen.dart';
import 'package:Store/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return ChangeNotifierProvider(
      create: (context) => Root(),
      child: MaterialApp(
          title: 'Organic Store',
          theme: ThemeData(
            primaryColor:  Color(0xFF43a047),
            accentColor:  Color(0xFFffcc00),
            primaryColorBrightness: Brightness.dark,
            appBarTheme:
                AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
            textTheme: TextTheme(
              headline5: TitleTextStyle,
              headline6: Body1TextStyle,
            ),
            primarySwatch: Colors.lightGreen,
            visualDensity: VisualDensity.adaptivePlatformDensity,

          ),
          home: SplashScreenPage()),
    );
  }
}
