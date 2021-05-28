import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsPage extends StatefulWidget {
  final String titleText;
  final int readTime;
  final String imageUrl;
  final String textContent;

  NewsPage(this.titleText, this.readTime, this.imageUrl, this.textContent);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 25, 12, 12),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [],
          ),
        ),
      ),
    );
  }
}