import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/Profile.dart';
import 'package:provider/provider.dart';

var userAge = '';
var userDepartment = '';
var userGender = '';
var userName = '';
var UserID = '';
var userPulse = '';
var userTemp = '';
var userDate = '';

class DatabaseService {
  String uid;

  DatabaseService({this.uid});
  //reference to firestore DB
  getCollections(uid) async {
    UserID = uid;
    DocumentSnapshot documentSnapshot =
        await Firestore.instance.collection('userDetails').document(uid).get();
    print(documentSnapshot['Age']);
    print(documentSnapshot['Department']);
    print(documentSnapshot['Gender']);
    print(documentSnapshot['Name']);
    print(documentSnapshot['Pulse']);
    print(documentSnapshot['Temp']);

    userAge = await documentSnapshot['Age'];
    userDepartment = await documentSnapshot['Department'];
    userGender = await documentSnapshot['Gender'];
    userName = await documentSnapshot['Name'];
    userTemp = await documentSnapshot['Temp'];
    userPulse = await documentSnapshot['Pulse'];
    userDate = await documentSnapshot['Date'];
  }

  //get collections
  // Stream<QuerySnapshot> get userDetails {
  //   return dbCollection.snapshots();
  // }
}
