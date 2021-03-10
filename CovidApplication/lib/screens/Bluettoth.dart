import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var BLE_ID = '';
var BLE_TIME = '';

class Bluetooth extends StatefulWidget {
  @override
  _BluetoothState createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  // fetchData() async {
  //   DocumentSnapshot documentSnapshot = await Firestore.instance
  //       .collection('data')
  //       .document('DFu8XnhKXny0oKENUzov')
  //       .get();

  //   BLE_ID = await documentSnapshot['BLE_ID'];
  //   BLE_TIME = await documentSnapshot['BLE_TIME'];

  //   setState(() {
  //     BLECards(time: BLE_ID, id: BLE_TIME);
  //   });
  // }

  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(
            'Campus Tracker',
            style: TextStyle(
                color: Colors.amber[200],
                fontWeight: FontWeight.w900,
                fontFamily: 'Roboto',
                fontSize: 16,
                letterSpacing: 5),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Column(children: [
          Column(
            children: [
              Center(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  child: Text(
                    "Fetch Today's Data",
                    style: TextStyle(
                        color: Colors.cyan[800],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        letterSpacing: 8),
                  ),
                  color: Colors.amber[200],
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    //this is used to move staright back to default page
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                  child: Text(
                    'GO BACK TO HOME',
                    style: TextStyle(
                        color: Colors.cyan[800],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        letterSpacing: 8),
                  ),
                  color: Colors.amber[200],
                ),
              ),
            ],
          ),
          Visibility(
            visible: _visible,
            child: DelayedDisplay(
              delay: Duration(seconds: 2),
              child: Column(
                children: [
                  BLECards(time: '09:45:45', id: 'hcbedsac5sacs4'),
                  BLECards(time: '10:11:02', id: 'dvs45sgreh86th'),
                  BLECards(time: '10:55:50', id: 'iu45hjg145df51'),
                  BLECards(time: '11:16:09', id: 'Zxdfv5vb45bsre'),
                  BLECards(time: '11:41:44', id: 'dvxf14fdbgrhth'),
                ],
              ),
            ),
          ),
        ]));
  }
}

class BLECards extends StatelessWidget {
  final String time;
  final String id;

  BLECards({this.time, this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.do_not_disturb_off,
          color: Colors.red,
        ),
        title: Text(
          '        DETECTED!',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto',
              fontSize: 12,
              letterSpacing: 5),
        ),
        trailing: Text(
          time,
          style: TextStyle(color: Colors.grey[400]),
        ),
        subtitle: Text(
          '     ' + id,
          style: TextStyle(letterSpacing: 5, color: Colors.grey[400]),
        ),
      ),
    );
  }
}
