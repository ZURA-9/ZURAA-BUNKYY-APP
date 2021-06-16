import 'package:app1/Bottom%20Navigation%20Bar/navigation.dart';
import 'package:app1/DashBoard%20and%20calender/calender.dart';
import 'package:app1/DashBoard%20and%20calender/dashboard.dart';
import 'package:app1/Screen/Class/Class_details.dart';
import 'package:app1/Side%20Drawer/main_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/category - HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseRefrence = FirebaseDatabase.instance.reference();
  var user = FirebaseAuth.instance.currentUser;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MainDrawer(
            // user: user,
            ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  IconButton(
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 35,
                      ))
                ],
              ),
            ),
            DashBoard(),
            SizedBox(
              height: 30,
            ),
            Calender(),
            SizedBox(
              height: 5,
            ),
            ClassItem(
              user: user,
            )
          ],
        ),
        bottomNavigationBar: Navigation(
          selectedIndex: 1,
        ));
  }
}
