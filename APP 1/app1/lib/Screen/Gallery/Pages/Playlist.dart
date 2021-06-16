import 'package:flutter/material.dart';

class Playlist_tab extends StatefulWidget {
  static const routeName = '/category - playlist_tab';
  @override
  _Playlist_tabState createState() => _Playlist_tabState();
}

class _Playlist_tabState extends State<Playlist_tab> {
  @override
  Widget build(BuildContext context) {
    // final String routeArgs = ModalRoute.of(context).settings.arguments;
    // String subject = routeArgs;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "sfdv",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
