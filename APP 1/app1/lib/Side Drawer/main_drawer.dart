import 'package:app1/Bunk/bunk_mainScreen.dart';
import 'package:app1/Login/Signup/login.dart';
import 'package:app1/Screen/Gallery/gallery_main_data_screen.dart';
import 'package:app1/Screen/Gallery/gallery_mainscreen.dart';
import 'package:app1/Screen/Homescreen.dart';
import 'package:app1/Screen/Settings/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  // User user;
  // MainDrawer({this.user});
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String username = '';
  final databaseRefrence = FirebaseDatabase.instance.reference();
  var user = FirebaseAuth.instance.currentUser;
  Future getname() async {
    await databaseRefrence
        .child('User/')
        .child(user.uid)
        .child('name')
        .once()
        .then((snapshot) => {
              this.setState(() {
                this.username = snapshot.value;
              })
            });
  }

  @override
  void initState() {
    super.initState();
    getname();
  }

  Widget buildListTile(String title, IconData icon, Function tapHandeler) {
    //Fuction tapHandeler to add function..for on pressed
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      onTap: tapHandeler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey,
                ),
                title: Text(username,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  'with us for 1 months',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          buildListTile(
            'Home',
            Icons.home,
            () {
              Navigator.of(context).pushReplacementNamed(
                HomeScreen.routeName,
              );
            },
          ), // to navigate to nxt page use //
          buildListTile('Feed', Icons.photo, () {
            Navigator.of(context).pushReplacementNamed(
              Gallery.routeName,
            );
          }),

          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Settings.routeName);
          }),

          buildListTile('Bunk', Icons.add_to_home_screen_rounded, () {
            Navigator.of(context).pushReplacementNamed(BunkMainScreen.routeName,
                arguments: user);
          }),
          Spacer(),
          ListTile(
              leading: Icon(
                Icons.person,
                size: 25,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              })
        ],
      ),
    );
  }
}
