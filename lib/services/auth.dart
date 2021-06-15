import 'package:firebase_auth/firebase_auth.dart';
import 'package:l2/models/us.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
 final FirebaseAuth _auth = FirebaseAuth.instance;
 final _firestoreInstance  = FirebaseFirestore.instance;
 Us _userFromFirebaseUser (User user){
   return user != null ? Us(uid : user.uid) : null;
 }

 Stream<Us> get user{
   return _auth.authStateChanges().map(_userFromFirebaseUser);
 }
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);

      return true;
    } catch (error){
      print(error.toString());
    //  return null;
      return false;
    }
  }
 Future<bool> registerWithEmailAndPassword(String email, String password) async {
   try {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
 return true;
   } catch (error){
     print(error.toString());
  //
     return false;
   }
 }


 Future signOut() async{
   try {
     return await _auth.signOut();
   }
   catch(e){
     print(e.toString());
     return null;
   }
 }

}