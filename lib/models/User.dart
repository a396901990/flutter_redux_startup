class User {
  final String id;
  final String name;
  final String gender;
  final String icon;

  User({this.id, this.name, this.gender, this.icon});

  factory User.formJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'],
      name: json['userName'],
      gender: json['userGender'],
      icon: json['userIcon'],
    );
  }
}
