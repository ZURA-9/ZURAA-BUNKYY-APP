import 'package:app1/Bottom%20Navigation%20Bar/navigation.dart';
import 'package:app1/Screen/Homescreen.dart';
import 'package:app1/Screen/Settings/setting_data.dart';

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const routeName = '/category - Setting';
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName),
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                )),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
                child: Text(
                  'GENERAL',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Setting_data()
            ],
          ),
        ),
        bottomNavigationBar: Navigation(
          selectedIndex: 0,
        ));
  }
}
