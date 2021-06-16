import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  List<String> dates = [
    DateFormat.d().format(DateTime.now().subtract(Duration(days: 2))),
    DateFormat.d().format(DateTime.now().subtract(Duration(days: 1))),
    DateFormat.d().format(DateTime.now().subtract(Duration(days: 0))),
    DateFormat.d().format(DateTime.now().add(Duration(days: 1))),
    DateFormat.d().format(DateTime.now().add(Duration(days: 2)))
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          (dates[0]),
          style: TextStyle(fontSize: 25, color: Colors.black.withOpacity(.3)),
        ),
        Text(
          (dates[1]),
          style: TextStyle(fontSize: 25, color: Colors.black.withOpacity(.5)),
        ),
        Text(
          (dates[2]),
          style: TextStyle(
              fontSize: 25,
              color: Colors.black.withOpacity(1),
              fontWeight: FontWeight.bold),
        ),
        Text(
          (dates[3]),
          style: TextStyle(fontSize: 25, color: Colors.black.withOpacity(.5)),
        ),
        Text(
          (dates[4]),
          style: TextStyle(fontSize: 25, color: Colors.black.withOpacity(.3)),
        ),
      ],
    );
  }
}
