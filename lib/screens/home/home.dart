import 'package:coffee_break/models/coffee.dart';
import 'package:coffee_break/screens/home/coffee_list.dart';
import 'package:coffee_break/screens/home/settings_panel.dart';
import 'package:coffee_break/services/auth.dart';
import 'package:coffee_break/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Settings(),
            );
          });
    }

    return StreamProvider<List<Coffee>>.value(
      value: DatabaseService().coffees,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
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
              ),
            ),
            FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: CoffeeList(),
      ),
    );
  }
}
