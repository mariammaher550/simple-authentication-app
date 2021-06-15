import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:l2/models/us.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> add_data(String email, String password) async {
  DocumentReference ref = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid);
  ref.set({'Email' : email, 'Password': password});
  return;
}
class get_password extends StatelessWidget{

  DocumentReference ref = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: ref.get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> map = snapshot.data.data() as Map<String, dynamic>;
            return Text("Password: ${map['Password']}");
          }
          return CircularProgressIndicator();
        }
    );
  }
}
class get_email extends StatelessWidget{
  DocumentReference ref = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: ref.get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> map = snapshot.data.data() as Map<String, dynamic>;
            return Text("Email: ${map['Email']}");
          }
          return CircularProgressIndicator();
        }
    );
  }
}
