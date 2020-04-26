import 'package:flutter/material.dart';

import './pages/homepage.dart';
import './sleeprecord.dart';

void main() => runApp(MyApp());

List<SleepRecord> sleepRecords = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Tracker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Sleep Tracker', sleepRecords: sleepRecords),
    );
  }
}
