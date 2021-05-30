class Feed {
  final String title;
  final String link;
  final String description;
  final String pubDate;

  Feed(
      {this.title,
      this.link,
      this.description,
      this.pubDate,
      });

  @override
  String toString() {
    return 'Feed{title: $title, link: $link, description: $description, lastBuildDate: $pubDate}';
  }
}
