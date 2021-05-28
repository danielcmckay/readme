import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xff282B33),
        fontFamily: 'Open Sans',
        textTheme: TextTheme().copyWith(
            bodyText2: TextStyle(color: Colors.white),
            headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white)));
  }
}
