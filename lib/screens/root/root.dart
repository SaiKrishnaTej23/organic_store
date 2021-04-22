import 'package:Store/auth.dart';
import 'package:Store/providers/root.dart';
import 'package:Store/screens/home/storeScreen.dart';
import 'package:Store/screens/login/loginScreen.dart';
import 'package:Store/screens/splash/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus { loggedIn, notLoggedIn, loading }

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  AuthStatus _authStatus = AuthStatus.loading;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    checkUserLogin().then((value) => {
          if (value) {
            Provider.of<Root>(context, listen: false).updateUser(getLoggedInUser())
          }
          else {

          }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    final _auth = Provider.of<Root>(context).getUser();
    if (_auth != null) {
      this.setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    } else {
      this.setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }

    switch (_authStatus) {
      case AuthStatus.loggedIn:
        retVal = StoreHomePage(user: getLoggedInUser());
        break;
      case AuthStatus.notLoggedIn:
        retVal = LoginScreen();
        break;
      case AuthStatus.loading:
        retVal = SplashScreenPage();
    }

    return retVal;
  }
}
