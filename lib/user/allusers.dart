import 'package:flutter/material.dart';

class AllUsersPage extends StatefulWidget {
  @override
  _AllUsersPageState createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: Center(
        child: Text('Common access apge to all GoRitzy user'),
      ),
    );
  }
}