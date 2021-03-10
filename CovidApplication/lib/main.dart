import 'package:flutter/material.dart';
import 'package:mi_card/models/user.dart';
import 'package:mi_card/screens/Wrapper.dart';
import 'package:mi_card/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      //this StreamProvider is actively listening for auth changes
      value: AuthService().user, //this is the stream we are going to listen to
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
