import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mi_card/services/auth.dart';
import 'Bluettoth.dart';
import 'GPS.dart';
import '../services/auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mi_card/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  String age;

  Profile({this.age});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black12,
              backgroundImage: AssetImage('images/frame2.jpg'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              userName,
              style: TextStyle(
                fontFamily: 'Roboto',
                letterSpacing: 6,
                fontSize: 20,
                color: Colors.amber[200],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.blueGrey[900],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      UserID.substring(7),
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.dvr,
                      color: Colors.blueGrey[900],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      ' ' + userDepartment,
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.blueGrey[900],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      userDate,
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Gender',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      userGender,
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Age',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      userAge,
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.graphic_eq,
                      color: Colors.blueGrey[900],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Pulse ',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 8),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      userPulse,
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Temp',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      userTemp,
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 28,
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Navigator.push(context, Bluetooth());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bluetooth()),
                      );
                    },
                    child: Text(
                      'Campus Tracking System',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                    color: Colors.amber[200],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Navigator.push(context, GPS());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GPS()),
                      );
                    },
                    child: Text(
                      'In-State Tracking System',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 5),
                    ),
                    color: Colors.amber[200],
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(UserID);
                      print(userAge);
                      print(userDepartment);
                      print(userGender);
                      print(userName);
                      print(userPulse);
                      print(userTemp);
                      setState(() {});
                    },
                    child: Text(
                      '  Get Employee Details  ',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 5),
                    ),
                    color: Colors.amber[200],
                  ),
                  SizedBox(
                    height: 20,
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
