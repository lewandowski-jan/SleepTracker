import 'package:flutter/material.dart';

import './pages/homepage.dart';
import './sleeprecord.dart';

void main() => runApp(MyApp());

List<SleepRecord> sleepRecords = [
  SleepRecord("10:42", "Nap", "6 hour 4 minute"),
  SleepRecord("10:42", "Night's sleep", "3 hour 26 minute"),
];

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
