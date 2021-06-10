import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:l2/models/us.dart';
import 'package:l2/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final u = Provider.of<Us>(context);
      print(u);
    return u == null ? Authenticate() : Home();
  }
}

