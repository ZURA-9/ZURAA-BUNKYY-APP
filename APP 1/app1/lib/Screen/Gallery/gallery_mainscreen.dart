import 'package:app1/Bottom%20Navigation%20Bar/navigation.dart';
import 'package:app1/Models/subject_data.dart';
import 'package:app1/Side%20Drawer/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'gallery_grid_view.dart';

class Gallery extends StatelessWidget {
  User user;
  Gallery({this.user});
  static const routeName = '/category - Gallery';
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey2,
        drawer: MainDrawer(), //(user: user,),
        body: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            child: Stack(
              children: [
                IconButton(
                    onPressed: () => _scaffoldKey2.currentState.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 35,
                    ))
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(25),
              children: information
                  .map((galData) => ClassItem(galData.subjectName))
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
            ),
          ),
        ]),
        bottomNavigationBar: Navigation(
          selectedIndex: 2,
        ));
  }
}
