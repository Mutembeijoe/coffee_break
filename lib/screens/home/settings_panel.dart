import 'package:coffee_break/shared/constants.dart';
import 'package:flutter/material.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
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
            value: _currentSugar ?? "0",
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
            value: (_currentStrength ?? 100).toDouble(),
            min: 100.0,
            max: 900.0,
            divisions: 8,
            onChanged: (val) => {setState(() => _currentStrength = val.round())},
            activeColor: Colors.brown[_currentStrength ?? 100],
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                print(_currentSugar);
                print(_currentName);
                print(_currentStrength);
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
  }
}
