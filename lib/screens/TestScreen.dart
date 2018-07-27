import "package:flutter/material.dart";

class TestScreen extends StatelessWidget {
  final String title;

  TestScreen(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: new Center(child: new Text(title)));
  }
}
