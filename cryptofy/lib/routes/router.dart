import 'package:cryptofy/templates/newsFeeds/newsCategories.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class MyRouter extends StatefulWidget {
  MyRouter({Key key}) : super(key: key);

  @override
  _MyRouterState createState() => _MyRouterState();
}

List<Widget> routes = [
  MyApp(),
  NewsCategories(),
  null,
];

class _MyRouterState extends State<MyRouter> {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}