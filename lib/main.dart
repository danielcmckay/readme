import 'package:flutter/material.dart';
import 'package:readme/pages/newsPage.dart';
import 'package:readme/pages/readPage.dart';
import 'package:readme/theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: ReadPage(
        "Hello Wolrd",
        21,
        "https://source.unsplash.com/random",
        "Hello world"
      ),
    );
  }
}