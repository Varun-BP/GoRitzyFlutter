import 'package:flutter/material.dart';

class NoAccessPage extends StatefulWidget {
  @override
  _NoAccessPagePageState createState() => _NoAccessPagePageState();
}

class _NoAccessPagePageState extends State<NoAccessPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Restricted...!'),
      ),
      body: Center(
        child: Text('Only GoRitzy admin has access to this page'),
      ),
    );
  }
}