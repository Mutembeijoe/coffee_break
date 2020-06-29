import 'package:flutter/material.dart';

final inputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.brown[300],
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.brown[800],
    ),
  ),
);
