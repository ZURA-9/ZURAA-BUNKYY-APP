import 'package:app1/Bottom%20Navigation%20Bar/navigation.dart';
import 'package:app1/Side%20Drawer/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'All_Bunk_List.dart';
import 'Model/Vote.dart';
import 'bunk_database.dart';
import 'package:intl/intl.dart';

class BunkMainScreen extends StatefulWidget {
  static const routeName = '/category - BunkMainScreen';
  @override
  _BunkMainScreenState createState() => _BunkMainScreenState();
}

class _BunkMainScreenState extends State<BunkMainScreen> {
  List<Vote> massbunk = [];
  //var user = FirebaseAuth.instance.currentUser;
  void updatePosts() {
    Bunk_Databse.getAllVotes().then((posts) => {
          this.setState(() {
            this.massbunk = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePosts();
  }

  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    final User routeArgs = ModalRoute.of(context).settings.arguments;
    User current_user = routeArgs;
    //  print(routeArgs);
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      body: AllBunks(this.massbunk, current_user),
      bottomNavigationBar: Navigation(
        selectedIndex: 1,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_outlined),
        onPressed: () {
          print(date);
        },
      ),
    );
  }
}
