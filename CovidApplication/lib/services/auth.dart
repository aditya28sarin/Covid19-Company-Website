import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_card/models/user.dart';

class AuthService {
  //we create an isntance of the firebase auth and use _ as we want it to be private and not used outside this file and _auth is of type FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser (Custom object)
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change using stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(
        _userFromFirebaseUser); //everytime we get a Firebase user from the stream we map it to our own custom user
  }

  //sign in using anonymous
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin using email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
