import './User.dart';

class Team {
  final User user;
  final String destination;
  final String type;
  final String content;
  final String date;
  final String startDate;
  final String endDate;
  final String contactPhone;
  final String contactQQ;
  final String contactWeChat;
  final List<String> pics;
  final int hot;
  final String createdAt;
  final String updatedAt;

  Team(
      {this.user,
      this.destination,
      this.type,
      this.content,
      this.date,
      this.startDate,
      this.endDate,
      this.contactPhone,
      this.contactQQ,
      this.contactWeChat,
      this.pics,
      this.hot,
      this.createdAt,
      this.updatedAt});

  factory Team.formJson(Map<String, dynamic> json) {
    return Team(
      user: User.formJson(json),
      destination: json['destination'],
      type: json['type'],
      content: json['content'],
      date: json['date'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      contactPhone: json['contactPhone'],
      contactQQ: json['contactQQ'],
      contactWeChat: json['contactWeChat'],
      pics: json['pics'].cast<String>(),
      hot: json['hot'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
