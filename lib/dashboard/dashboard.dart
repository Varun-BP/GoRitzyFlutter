import 'package:flutter/material.dart';
import '../user/user_management.dart';
import '../user/adminonly.dart';
import '../user/allusers.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  UserManagement userObj = new UserManagement();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('GoRitzty_user'),
                accountEmail: new Text('vrntestmail@test.com'),
                currentAccountPicture: new CircleAvatar(
                  //backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                  child: new Image.asset(
                    'assets/ic_user_profile.png',
                  ),
                ),
              ),
              new ListTile(
                title: new Text('Allusers Page'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new AllUsersPage()));
                },
              ),
              new ListTile(
                title: new Text('Admins only'),
                onTap: () {
                  Navigator.of(context).pop();
                  userObj.authorizeAdmin(context);
                },
              ),
              new ListTile(
                title: new Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop();
                  userObj.signOut();
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('All Users Dashboard'),
        ));
  }

}