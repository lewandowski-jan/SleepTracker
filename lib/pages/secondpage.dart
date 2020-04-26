import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../sleeprecord.dart';
import '../functions.dart';

class SecondPage extends StatefulWidget {
  final DateTime now;
  final List<SleepRecord> sleepRecords;

  SecondPage({
    Key key,
    @required this.now,
    this.sleepRecords,
  }) : super(key: key);

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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: Material(
                elevation: 20.0,
                child: Image.asset('assets/womanbaby.jpg'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black54),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.calendar_today, color: Colors.indigo),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Date and time',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        '${widget.now.day} ${getMonth(widget.now.month)} ${widget.now.year}, ${widget.now.hour.toString().padLeft(2, '0')}:${widget.now.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black54),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.brightness_2, color: Colors.indigo),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sleep type',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black54),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.indigo,
                    size: 30.0),
                  SizedBox(
                    width: 14.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sleep duration',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
