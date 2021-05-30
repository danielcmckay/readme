import 'package:http/http.dart' as http;
import 'package:readme/reader/Feed.dart';
import 'package:xml/xml.dart';

class Reader {
  final url = 'https://hnrss.org/newest?count=50';

  Future<List<Feed>> getFeed() async {
    final response = await http.get(Uri.parse(url));
    final document = XmlDocument.parse(response.body);
    // print(document.toXmlString());
    final feedList = List<Feed>.empty(growable: true);
    final items = document.findAllElements("item");

    // print("Printing: " + items.toString());

    if (response.statusCode == 200) {
      items.forEach((element) {
        feedList.add(Feed(
          title: element.getElement("title").innerText,
          link: element.getElement("link").innerText,
          description: "",
          pubDate: element.getElement("pubDate").innerText,
        ));
      });

      return feedList;
    } else {
      print("Exception here " + response.body);
      throw Exception('Could not hit endpoint');
    }
  }
}
