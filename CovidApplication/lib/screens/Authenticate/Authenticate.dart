import 'package:flutter/material.dart';
import 'package:mi_card/screens/Authenticate/SignIn.dart';
import 'package:mi_card/services/auth.dart';
import '../Profile.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}
