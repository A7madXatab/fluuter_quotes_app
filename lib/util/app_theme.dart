import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  accentColor: Colors.blue,
  buttonColor: Colors.lightBlue,
  errorColor: Colors.deepOrange,
  textTheme: TextTheme(
    body1: TextStyle(fontFamily: 'Livvic', fontSize: 15),
    title: TextStyle(
        fontFamily: 'Livvic',
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.w700),
  ),
);
