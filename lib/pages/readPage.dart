import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReadPage extends StatefulWidget {
  final String titleText;
  final int readTime;
  final String imageUrl;
  final String textContent;

  ReadPage(this.titleText, this.readTime, this.imageUrl, this.textContent);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
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