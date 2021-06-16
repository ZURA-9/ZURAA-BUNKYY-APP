import 'package:app1/Screen/Gallery/gallery_mainscreen.dart';
import 'package:app1/Screen/Homescreen.dart';
import 'package:app1/Screen/Settings/setting_screen.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  static const routeName = '/category - homepage';
  int selectedIndex;
  Navigation({this.selectedIndex});
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //onTap: _selectPage,

      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      currentIndex: widget.selectedIndex,
      type: BottomNavigationBarType.shifting,
      //selectedFontSize: ,
      //unselectedFontSize: ,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Settings.routeName);
                },
                child: Icon(Icons.settings)),
            title: Text('Setting')),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
                child: Icon(Icons.home)),
            title: Text('Home')),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Gallery.routeName);
                },
                child: Icon(Icons.photo)),
            title: Text('Gallery'))
      ],
    );
  }
}
