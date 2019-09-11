import 'package:flutter/material.dart';
import 'dart:async';
import 'user/user_management.dart';
import 'login/loginpage.dart';
import 'dashboard/dashboard.dart';

void main() => runApp(GoRitzy());

class GoRitzy extends StatelessWidget {

  UserManagement userObj = new UserManagement();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoRitzy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(title: 'GoRitzy'),
      routes: <String, WidgetBuilder>{
        '/Nextscreen': (BuildContext context) => userObj.handleAuth(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);

    return new Timer(_duration, navigationPage);

  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Nextscreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splash_screen_background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 100.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: 180.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/splash_screen_logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    new Padding(padding: const EdgeInsets.only(top: 10.0)),
                    new Text('Clean . Hygiene . Stylish', style: TextStyle(fontSize: 15.0, color: Colors.white)),

                  ],
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text('Powered by ', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                    new Text('GoRitzy', style: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}