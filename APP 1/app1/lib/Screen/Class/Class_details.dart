import 'package:app1/Authentication/database.dart';
import 'package:app1/Bunk/Model/Vote.dart';
import 'package:app1/Models/subject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottom_list_content.dart';

class ClassItem extends StatefulWidget {
  User user;
  ClassItem({this.user});
  @override
  _ClassItemState createState() => _ClassItemState();
}

class _ClassItemState extends State<ClassItem> {
  List<Subject> subjects_data = [];
  /* void updateSubjectData() {
    database_service.getAlldata().then((value) => {
          this.setState(() {
            this.subjects_data = value;
          })
        });
  }*/

  Future getData() async {
    await database_service.getAlldata(widget.user).then((value) => {
          this.setState(() {
            this.subjects_data = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    print(widget.user.uid);
    getData();
  }

  void details(BuildContext ctx, Subject st) {
    showBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        context: ctx,
        builder: (_) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                // color: Colors.white,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                height: 450,
                width: 350,
                child: Content(st, widget.user)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.9,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TextButton(
                  onPressed: () => details(context, subjects_data[index]),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Text(
                          subjects_data[index].allias,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      title: Text(
                        subjects_data[index].subjectName,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        subjects_data[index].teacherName,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ));
            },
            itemCount: subjects_data.length,
          ),
        ),
      ],
    );
  }
}
