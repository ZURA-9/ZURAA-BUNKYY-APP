import 'package:flutter/material.dart';

class Books_Tab extends StatefulWidget {
  static const routeName = '/category - books_tab';
  @override
  _Books_TabState createState() => _Books_TabState();
}

class _Books_TabState extends State<Books_Tab> {
  @override
  Widget build(BuildContext context) {
    // final String routeArgs = ModalRoute.of(context).settings.arguments;
    // String subject = routeArgs;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "sf",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
