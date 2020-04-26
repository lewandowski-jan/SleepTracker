import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../sleeprecord.dart';
import '../functions.dart';

class SecondPage extends StatefulWidget {
  final DateTime now;
  final List<SleepRecord> sleepRecords;

  SecondPage({
    Key key,
    @required this.now, this.sleepRecords,
  }) : super(key : key);

  createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  _SecondPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Sleeping Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}