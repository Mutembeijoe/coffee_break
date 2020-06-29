import 'package:coffee_break/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text("Home"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
