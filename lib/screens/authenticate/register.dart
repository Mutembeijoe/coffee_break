import 'package:coffee_break/services/auth.dart';
import 'package:coffee_break/shared/constants.dart';
import 'package:coffee_break/shared/loader.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String error = '';

  // form fields
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loader()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[300],
              title: Text("Sign Up"),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text("Sign In"))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      error,
                      style: TextStyle(
                          color: Colors.redAccent[700], fontSize: 14.0),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: inputDecoration.copyWith(hintText: "Email"),
                      validator: (val) =>
                          val.isEmpty ? "Enter an email address" : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: "Password"),
                      validator: (val) => val.length < 6
                          ? "Password should be at least 6 characters long"
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => isLoading = true);
                          dynamic result =
                              await _auth.signUpWithEmailAndPassword(
                                  email: email, password: password);

                          if (result == null) {
                            setState(() {
                              error = "Invalid Email";
                              isLoading = false;
                            });
                          }
                        }
                      },
                      color: Colors.brown[400],
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
