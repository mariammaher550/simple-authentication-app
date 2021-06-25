import 'package:flutter/material.dart';
import 'package:l2/services/auth.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
   body: Container(
     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
     child: Form(
         key: _formKey,
       child: Column(
         children: <Widget>[
           SizedBox(height: 20.0),
           TextFormField(
             decoration: InputDecoration(
                 helperText: 'EMAIL'
             ),
             validator: (val) => val.isEmpty ? 'Enter an email': null,
             onChanged: (val){
               setState(() => email = val);

             },
           ),
           SizedBox(height: 20.0),
           TextFormField(
             obscureText: true,
             decoration: InputDecoration(
                 helperText: 'PASSWORD'
             ),
             validator: (val) => val.length < 6 ? 'Invalid password format'  : null,
             onChanged: (val){
               setState(() => password = val);
             },
           ),
           SizedBox(height: 20.0),
           RaisedButton(
             child: Text(
               'LOGIN',
             ),
             onPressed: () async {
               if (_formKey.currentState.validate()) {
                 dynamic result = await _auth.signInWithEmailAndPassword(
                     email, password);
                 if (result != '') {
                   setState(() {
                     //error = 'Could not sign in, wrong email and/or password';
                     error = result;
                   });
                 }
               }
             }
           ),
           SizedBox(height: 12.0),
           Text(
             error,
             style: TextStyle(color: Colors.red, fontSize: 14.0),
           )
         ],
       )
     ),
   ),
    );
  }
}
