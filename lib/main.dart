import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:l2/screens/wrapper.dart';
import 'package:l2/models/us.dart';
import 'package:l2/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Us>.value(
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(),
      ),
    );
  }
}
