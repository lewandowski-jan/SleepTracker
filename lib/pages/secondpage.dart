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
  var _options = ['-', 'Night\'s Sleep', 'Nap'];
  var _currentItemSelected = '-';

  int _currentHourValue = 0;
  int _currentMinuteValue = 0;
  NumberPicker decimalNumberPicker;

  Future _showHourDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 0,
          maxValue: 12,
          step: 1,
          initialIntegerValue: _currentHourValue,
          title: Text("Pick number of hours"),
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => _currentHourValue = value);
      }
    });
  }

  Future _showMinuteDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 0,
          maxValue: 59,
          step: 1,
          initialIntegerValue: _currentMinuteValue,
          title: Text("Pick number of minutes"),
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => _currentMinuteValue = value);
      }
    });
  }

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
        child: ListView(
          children: <Widget>[
            Container(
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
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
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
                      DropdownButton<String>(
                        hint: Text('Night, nap, etc.'),
                        isDense: true,
                        items: _options.map(
                          (String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          },
                        ).toList(),
                        onChanged: (String value) {
                          setState(() {
                            this._currentItemSelected = value;
                          });
                        },
                        value: _currentItemSelected,
                      ),
                      SizedBox(
                        height: 2.0,
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5.0, bottom: 5.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.timer, color: Colors.indigo, size: 30.0),
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
                      Row(children: [
                        FlatButton(
                          color: Colors.black12,
                          onPressed: () => _showHourDialog(),
                          child: Text(
                            '$_currentHourValue hour',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        FlatButton(
                          color: Colors.black26,
                          onPressed: () => _showMinuteDialog(),
                          child: Text(
                            '$_currentMinuteValue minute',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        if (this._currentItemSelected != '-' && (this._currentHourValue != 0 || this._currentMinuteValue != 0)) {
                          var time = '${widget.now.hour.toString().padLeft(2, '0')}:${widget.now.minute.toString().padLeft(2, '0')}';
                          var type = this._currentItemSelected;
                          var duration = '$_currentHourValue hour $_currentMinuteValue minute';

                          widget.sleepRecords.insert(0, SleepRecord(time, type, duration));
                          Navigator.pop(context);
                        }
                        else {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (_) => AlertDialog(
                              title: Text('Fill in required fields!'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
