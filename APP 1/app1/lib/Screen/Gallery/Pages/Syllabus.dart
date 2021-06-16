import 'package:flutter/material.dart';

class Syllabus_Tab extends StatefulWidget {
  static const routeName = '/category - syllabus_tab';
  @override
  _Syllabus_TabState createState() => _Syllabus_TabState();
}

class _Syllabus_TabState extends State<Syllabus_Tab> {
  @override
  Widget build(BuildContext context) {
    // final String routeArgs = ModalRoute.of(context).settings.arguments;
    // String subject = routeArgs;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "sfvb",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
