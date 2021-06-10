import 'package:firebase_auth/firebase_auth.dart';
import 'package:l2/models/us.dart';
class AuthService {
 // String pw='';
 final FirebaseAuth _auth = FirebaseAuth.instance;
 Us _userFromFirebaseUser (User user){
   return user != null ? Us(uid : user.uid) : null;
 }

 Stream<Us> get user{
   return _auth.authStateChanges().map(_userFromFirebaseUser);
 }
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = credential.user;
      return _userFromFirebaseUser(user);
    } catch (error){
      print(error.toString());
      return null;
    }
  }
 Future registerWithEmailAndPassword(String email, String password) async {
   try {
     UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User user = credential.user;
     return _userFromFirebaseUser(user);
   } catch (error){
     print(error.toString());
     return null;
   }
 }
String get getEmail{
   User user = _auth.currentUser;
   return user.email;
}
 /*set setPw(String s){
   print(s);
   pw = s;
}*/
 /*String get getPassword{
   return pw;
 }*/
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