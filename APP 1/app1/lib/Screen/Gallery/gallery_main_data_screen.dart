import 'package:app1/Bottom%20Navigation%20Bar/navigation.dart';
import 'package:app1/Models/gallery_data.dart';
import 'package:app1/Screen/Gallery/Pages/Paper.dart';
import 'package:app1/Screen/Gallery/Pages/Playlist.dart';
import 'package:app1/Screen/Gallery/Pages/Syllabus.dart';
import 'package:app1/Screen/Gallery/Pages/books.dart';
import 'package:app1/Screen/Gallery/gallery_mainscreen.dart';
import 'package:app1/Side%20Drawer/main_drawer.dart';
import 'package:flutter/material.dart';

import '../Homescreen.dart';

class Gallery_main_data extends StatelessWidget {
  static const routeName = '/category - gallery_mainscreen_data';
  final List<Galleryclass> gallerydata = dfg();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String className = routeArgs['title'];

    List<Function> list_of_function = [
      () => Navigator.of(context)
          .pushReplacementNamed(Books_Tab.routeName, arguments: className),
      () => Navigator.of(context)
          .pushReplacementNamed(Syllabus_Tab.routeName, arguments: className),
      () => Navigator.of(context)
          .pushReplacementNamed(Paper_Tab.routeName, arguments: className),
      () => Navigator.of(context)
          .pushReplacementNamed(Playlist_tab.routeName, arguments: className),
    ];
    Widget ListViewBuilder(
        IconData ic1, String str, IconData ic2, Function taphandeler) {
      return TextButton(
        onPressed: taphandeler,
        child: Container(
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(60),
            ),
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      ic1,
                      size: 50,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      str,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ],
                ),
                Icon(
                  ic2,
                  size: 50,
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        key: _scaffoldKey2,
        drawer: MainDrawer(),
        body: Column(
          children: [
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
            Column(
              children: [
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(Gallery.routeName),
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 10, 0, 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  )),
                  child: Text(
                    className,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListViewBuilder(
                            (gallerydata[index].icon1).icon,
                            gallerydata[index].title,
                            (gallerydata[index].icon2).icon,
                            list_of_function[index]);
                      },
                      itemCount: gallerydata.length,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: Navigation(
          selectedIndex: 2,
        ));
  }
}
