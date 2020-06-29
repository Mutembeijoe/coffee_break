import 'package:coffee_break/models/user.dart';
import 'package:coffee_break/screens/authenticate/authenticate.dart';
import 'package:coffee_break/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return user !=null ? Home() :Authenticate();
  }
} 