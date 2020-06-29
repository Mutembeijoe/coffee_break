import 'package:coffee_break/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text("Sign In"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text("SignIn Anon"),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print("Error Loggin In");
              } else {
                print("Signed In");
                print(result.uid);
              }
            },
          )),
    );
  }
}
