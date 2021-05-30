import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readme/pages/readPage.dart';
import 'package:readme/reader/Feed.dart';
import 'package:readme/reader/reader.dart';
import 'package:readme/theme/custom_theme.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Reader reader = Reader();
  List<Widget> cards = List.empty(growable: true);
  List<Widget> topCards = List.empty(growable: true);
  Future<List<Feed>> futureFeed;

  @override
  void initState() {
    futureFeed = fetchFeed();
    super.initState();
  }

  void buildList() async {
    print("in build list");
    await futureFeed.then((value) => value.forEach((element) {
          cards.add(new StoryCard(
              element.title, 1, "https://source.unsplash.com/random"));
          topCards.add(new TopCard(
              element.title, 1, "https://source.unsplash.com/random"));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFeed,
      builder: (context, snapshot) {
        print("In builder");
        if (snapshot.hasData) {
          buildList();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(12, 25, 12, 12),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                      height: MediaQuery.of(context).size.height * .45,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Your News",
                                style:
                                    CustomTheme.darkTheme.textTheme.headline1),
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
                    Container(
                      height: MediaQuery.of(context).size.height * .40,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: cards,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}

Future<List<Feed>> fetchFeed() async {
  Reader reader = Reader();
  print("in fetch feed");
  return await reader.getFeed();
}

class StoryCard extends StatelessWidget {
  final String titleText;
  final int readTime;
  final String imageUrl;

  StoryCard(this.titleText, this.readTime, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    new ReadPage(titleText, readTime, imageUrl, "")))
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff25262C).withOpacity(1),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(1, 3), // changes position of shadow
                ),
              ]),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: Image.network(
                        imageUrl,
                        width: 150,
                        alignment: Alignment.center,
                        fit: BoxFit.fitWidth,
                        scale: 1,
                      ),
                    ),
                    height: 100),
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
                          titleText,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.0),
                        ),
                        Text(
                          "$readTime min read",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff77767C)),
                        )
                      ],
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

class TopCard extends StatelessWidget {
  final String titleText;
  final int readTime;
  final String imageUrl;

  TopCard(this.titleText, this.readTime, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    new ReadPage(titleText, readTime, imageUrl, "")))
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .80,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.network(
                    imageUrl,
                    width: 250,
                    height: 125,
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    scale: 1,
                  ),
                ),
                Text(
                  titleText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(
                  "$readTime min read",
                  style: TextStyle(fontSize: 12, color: Color(0xff77767C)),
                )
              ]),
        ),
      ),
    );
  }
}
