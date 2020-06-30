import 'package:coffee_break/models/user.dart';
import 'package:coffee_break/services/database.dart';
import 'package:coffee_break/shared/constants.dart';
import 'package:coffee_break/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final _formKey = GlobalKey<FormState>();

  String _currentSugar;
  String _currentName;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  initialValue: snapshot.data.name,
                  decoration: inputDecoration.copyWith(hintText: "Name"),
                  validator: (val) => val.isEmpty ? "Enter a name" : null,
                  onChanged: (val) {
                    setState(() => _currentName = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  value: _currentSugar ?? snapshot.data.sugars,
                  decoration: inputDecoration,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      child: Text('$sugar sugar(s)'),
                      value: sugar,
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentSugar = val),
                ),
                SizedBox(height: 20.0),
                Slider(
                  value:
                      (_currentStrength ?? snapshot.data.strength).toDouble(),
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  onChanged: (val) =>
                      {setState(() => _currentStrength = val.round())},
                  activeColor: Colors.brown[_currentStrength ?? snapshot.data.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? snapshot.data.strength ],
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        name: _currentName ?? snapshot.data.name,
                        sugars: _currentSugar ?? snapshot.data.sugars,
                        strength: _currentStrength ?? snapshot.data.strength,
                      );
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.brown[400],
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          return Loader();
        }
      },
    );
  }
}
