class NewsItem {
  final String url;
  final String desc;

  NewsItem({this.url, this.desc});

  factory NewsItem.formJson(Map<String, dynamic> json) {
    return NewsItem(
      url: json['url'],
      desc: json['desc'],
    );
  }
}
