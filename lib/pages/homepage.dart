import 'package:flutter/material.dart';

import './secondpage.dart';
import '../functions.dart';
import '../sleeprecord.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
    this.sleepRecords,
  }) : super(key: key);

  final String title;
  final List<SleepRecord> sleepRecords;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 25.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.brightness_2,
                color: Colors.white,
                size: 25.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35.0, top: 25.0, right: 35.0),
              child: Text(
                'Get to know your baby\'s sleep patterns and keep track of how much sleep they are getting here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10.0, top: 25.0, right: 10.0, bottom: 70.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        now = DateTime.now();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              now: now,
                              sleepRecords: widget.sleepRecords,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Add new sleeping record',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    '${getDay(now.weekday)}, ${now.day} ${getMonth(now.month)} ${now.year}',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ),
              ],
            ),
            Container(
              child: Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 20.0),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: widget.sleepRecords.length,
                    itemBuilder: (context, index) {
                      return getListTile(
                        widget.sleepRecords[index].time,
                        widget.sleepRecords[index].type,
                        widget.sleepRecords[index].duration);
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getListTile(time, type, duration) {
  var listTile = ListTile(
    title: Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              children: <Widget>[
                Text(
                  '$time',
                  style: TextStyle(fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$type',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  '$duration',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return listTile;
}
