import 'package:flutter/material.dart';

class NavigationIconViewComponent {
  NavigationIconViewComponent({
    Widget icon,
    String title,
    Widget page,
  })  : page = page,
        item = new BottomNavigationBarItem(
          icon: icon,
          title: new Text(title),
          backgroundColor: Colors.redAccent,
        );

  final Widget page;
  final BottomNavigationBarItem item;
}
