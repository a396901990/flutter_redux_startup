class NewsItem {
  final String title;
  final String content;

  NewsItem({this.title, this.content});

  factory NewsItem.formJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'],
      content: json['content'],
    );
  }
}
