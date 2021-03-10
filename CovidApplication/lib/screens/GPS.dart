import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class GPS extends StatefulWidget {
  @override
  _GPSState createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(
            'In State Tracker',
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
                    "Fetch Month's Data",
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
                  GPSCard(region: '    Western', date: '31/01/21'),
                  GPSCard(region: '    Western', date: '31/01/21'),
                  GPSCard(region: '    Western', date: '31/01/21'),
                  GPSCard(region: '    Western', date: '31/01/21'),
                  GPSCard(region: '    Western', date: '31/01/21'),
                ],
              ),
            ),
          ),
        ]));
  }
}

class GPSCard extends StatelessWidget {
  String region = '';
  String date = '';

  GPSCard({this.region, this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
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
          date,
          style: TextStyle(color: Colors.grey[400]),
        ),
        subtitle: Text(
          '     ' + region,
          style: TextStyle(letterSpacing: 5, color: Colors.grey[400]),
        ),
      ),
    );
  }
}
