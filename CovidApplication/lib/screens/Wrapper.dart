import 'package:flutter/material.dart';
import 'package:mi_card/models/user.dart';
import 'package:mi_card/screens/Profile.dart';
import 'package:provider/provider.dart';
import 'Authenticate/Authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user;
    user = Provider.of<User>(
        context); //this is accessing the user data from provider
    if (user == null) {
      return Authenticate();
    } else {
      return Profile();
    }
  }
}
