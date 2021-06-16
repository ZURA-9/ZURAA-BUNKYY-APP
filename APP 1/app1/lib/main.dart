import 'package:app1/Bunk/bunk_mainScreen.dart';
import 'package:app1/Screen/Gallery/Pages/Paper.dart';
import 'package:app1/Screen/Gallery/Pages/Playlist.dart';
import 'package:app1/Screen/Gallery/Pages/Syllabus.dart';
import 'package:app1/Screen/Gallery/Pages/books.dart';
import 'package:app1/Screen/Gallery/gallery_main_data_screen.dart';

import 'package:app1/Screen/Homescreen.dart';
import 'package:app1/Screen/Settings/setting_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Login/Signup/login.dart';
import 'Login/Signup/registeration.dart';
import 'Screen/Gallery/gallery_mainscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("User");

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? LoginScreen.routeName
            : HomeScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          RegistertionScreen.routeName: (context) => RegistertionScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          Gallery.routeName: (context) => Gallery(),
          Settings.routeName: (context) => Settings(),
          Gallery_main_data.routeName: (context) => Gallery_main_data(),
          BunkMainScreen.routeName: (context) => BunkMainScreen(),
          Paper_Tab.routeName: (context) => Paper_Tab(),
          Playlist_tab.routeName: (context) => Playlist_tab(),
          Books_Tab.routeName: (context) => Books_Tab(),
          Syllabus_Tab.routeName: (context) => Syllabus_Tab()
        },
      );
}
