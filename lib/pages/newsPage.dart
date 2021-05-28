import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readme/theme/custom_theme.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> cards = List();
    cards.add(new StoryCard());
    cards.add(new StoryCard());
    cards.add(new StoryCard());
    cards.add(new StoryCard());

    List<Widget> topCards = List();
    topCards.add(new TopCard());
    topCards.add(new TopCard());
    topCards.add(new TopCard());
    topCards.add(new TopCard());


    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0xff25262C).withOpacity(0.8),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
                height: 450,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Your News",
                          style: CustomTheme.darkTheme.textTheme.headline1),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: topCards,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text("Recommended",
                  style: CustomTheme.darkTheme.textTheme.headline1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: cards,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border(), boxShadow: [
          BoxShadow(
            color: Color(0xff25262C).withOpacity(1),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(1, 3), // changes position of shadow
          ),
        ]),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Image.network(
                    "https://source.unsplash.com/random",
                    width: 250,
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    scale: 1,
                  ),
                  height: 150),
            ),
            Container(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hundreds dead due to 'overwhelming stench' at Everest Base Camp",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18.0),
                      ),
                      Text("12 min read")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  const TopCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://source.unsplash.com/random",
                width: 400,
                height: 200,
                alignment: Alignment.center,
                fit: BoxFit.fitWidth,
                scale: 1,
              ),
              Expanded(
                child: Text(
                  "Hundreds dead due to 'overwhelming stench' at Everest Base Camp",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Text("12 min read")
            ]),
      ),
    );
  }
}
