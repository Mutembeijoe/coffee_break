import 'package:coffee_break/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;

  CoffeeTile(this.coffee);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          leading: CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.brown[coffee.strength],
          ),
          title: Text(coffee.name),
          subtitle: Text('Takes ${coffee.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
