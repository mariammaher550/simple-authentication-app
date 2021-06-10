import 'package:flutter/material.dart';
import 'package:l2/screens/authenticate/register.dart';
import 'package:l2/services/auth.dart';
class Home extends StatelessWidget {
final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          actions: <Widget>[
            FlatButton.icon(
              icon : Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async{
                await _auth.signOut();
              },
            )
          ],
        ),
        body:
        Center(
          child: Column(
          children: [
            SizedBox(height: 40),
            Text('Welcome',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(height: 20),
            Text('Email: '+ _auth.getEmail),
            SizedBox(height: 20),
           // Text('Password: ' + _auth.getPassword)
          ],
        ),
        )
      )
    );
  }
}
