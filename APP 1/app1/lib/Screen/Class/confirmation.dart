import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  final Function xyz;
  final String type;
  Confirmation(this.xyz, this.type);
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          'ARE YOU SURE!!!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {
              widget.xyz(widget.type);
            },
            child: Text('YES',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('NO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))
      ],
    );
  }
}
