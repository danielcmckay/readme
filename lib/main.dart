import 'package:flutter/material.dart';
import 'package:readme/pages/newsPage.dart';
import 'package:readme/reader/Feed.dart';
import 'package:readme/reader/reader.dart';
import 'package:readme/theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Feed> feeds;

  @override
  Widget build(BuildContext context) {
    getFeeds();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: NewsPage(),
      // home: ReadPage(
      //   "Hello World",
      //   21,
      //   "https://source.unsplash.com/random",
      //   "Hello world"
      // ),
    );
  }

  void getFeeds() async {
    Reader reader = Reader();
    List<Feed> feeds = await reader.getFeed();
    setState(() {
      feeds = feeds;
    });
  }
}
