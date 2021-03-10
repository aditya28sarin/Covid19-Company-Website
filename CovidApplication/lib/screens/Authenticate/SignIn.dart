import 'package:flutter/material.dart';
import 'package:mi_card/screens/Profile.dart';
import 'package:mi_card/services/database.dart';
import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //instance of the AuthService class
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black12,
                backgroundImage: AssetImage('images/company_logo.png'),
              ),
              SizedBox(
                height: 41,
              ),
              Text(
                'Employee Login',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  letterSpacing: 6,
                  fontSize: 20,
                  color: Colors.amber[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.blueGrey[200],
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Card(
                      //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      //   //padding: EdgeInsets.all(10),
                      //   color: Colors.white,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(12),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.phone,
                      //           color: Colors.blueGrey[900],
                      //         ),
                      //         SizedBox(
                      //           width: 30,
                      //         ),
                      //         Text(
                      //           '+91 xxxx-xxx-xxx',
                      //           style: TextStyle(
                      //               color: Colors.cyan[800],
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 17,
                      //               letterSpacing: 5),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),

                      // Card(
                      //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      //   // padding: EdgeInsets.all(10),
                      //   color: Colors.white,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(12),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.email,
                      //           color: Colors.blueGrey[900],
                      //         ),
                      //         SizedBox(
                      //           width: 30,
                      //         ),
                      //         Text(
                      //           'xxxxxx@gmail.com',
                      //           style: TextStyle(
                      //               color: Colors.cyan[800],
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 17,
                      //               letterSpacing: 5),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          print(email);
                          print(password);

                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'COULD NOT SIGN-IN!';
                              });
                            } else {
                              print(result.uid);
                              final DatabaseService _dbService =
                                  DatabaseService(uid: result.uid);
                              _dbService.getCollections(result.uid);
                            }
                          }
                          // dynamic result = await _auth.signInAnon();

                          // if (result == null) {
                          //   print('error signing in');
                          //   // Navigator.push(context, Profile());
                          // } else {
                          //   print('signedin');
                          //   print(result.uid);
                          //   // Navigator.push(context, Profile());
                          // }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.cyan[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              letterSpacing: 5),
                        ),
                        color: Colors.amber[200],
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
