import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        child: Column(children: <Widget>[
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
                color: Colors.black54
              )
            )
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 25.0, right: 10.0, bottom: 70.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add new sleeping record',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                )
              ],
            )
          ),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'WEDNESDAY, 13 JUL 2020',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87
                  )
                )
              )
            ],
          )
        ]),
      ),
    );
  }
}
