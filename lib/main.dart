import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_ritzy/homeScreen.dart';
import 'package:go_ritzy/view/login/login.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen(),
      '/LoginScreen': (BuildContext context) => new LoginPage()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);

    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    bool _islogged = false;
    if(_islogged) {
      Navigator.of(context).pushReplacementNamed('/HomeScreen');
    } else {
      Navigator.of(context).pushReplacementNamed('/LoginScreen');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/splash_screen_background.jpg'),
            fit: BoxFit.cover
        ) ,
      ),
      child: Center(
        child: new Image.asset('assets/splash_screen_logo.png'),
        ),
    );
  }
}