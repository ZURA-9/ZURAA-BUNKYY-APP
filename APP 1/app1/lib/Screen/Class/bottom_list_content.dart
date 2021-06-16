import 'dart:math';

import 'package:app1/Authentication/database.dart';
import 'package:app1/Bunk/Model/Vote.dart';
import 'package:app1/Bunk/New_Bunk.dart';
import 'package:app1/Bunk/bunk_database.dart';

import 'package:app1/Models/subject.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'confirmation.dart';

class Content extends StatefulWidget {
  final Subject sub;
  User user;
  Content(this.sub, this.user);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  // List<Vote> massbunk;
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  var r = Random();
  void _addnewbunk(String sub, String rea, DateTime choosenDate) {
    final newbunk = Vote(
        subject: sub,
        reason: rea,
        date: (DateFormat('EEE,MMM d').format(choosenDate)).toString(),
        id: List.generate(7, (index) => _chars[r.nextInt(_chars.length)])
            .join(),
        user_id: widget.user.uid,
        posted_date:
            (DateFormat('EEE,MMM d').format(DateTime.now())).toString());

    Bunk_Databse.createData(
      newbunk,
    );
    // massbunk.add(newbunk);
    print(newbunk);

    // Bunk_Databse.createData(bunk);
  }

  addbunk(BuildContext ctx, String sub) {
    showBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(child: NewBunk(_addnewbunk, sub));
        });
  }

  void counting(String type) {
    setState(() {
      if (type == 'Attended') {
        widget.sub.attended++;
        database_service.updateData(
            subjectname: widget.sub.subjectName,
            change: type,
            value: widget.sub.attended,
            user1: widget.user);
      }

      if (type == 'Missed') {
        widget.sub.missed++;
        database_service.updateData(
            subjectname: widget.sub.subjectName,
            change: type,
            value: widget.sub.missed,
            user1: widget.user);
      }
      widget.sub.total++;
      database_service.updateData(
          subjectname: widget.sub.subjectName,
          change: 'Total',
          value: widget.sub.total,
          user1: widget.user);
    });
    Navigator.pop(context);
  }

  void confirm(BuildContext ctx, String type) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        context: ctx,
        builder: (_) {
          return Container(
            height: 200,
            child: Confirmation(counting, type),
          );
        });
  }

  List<Vote> mass_bunk_data = [];
  void updatePosts() {
    Bunk_Databse.getAllVotes().then((posts) => {
          this.setState(() {
            this.mass_bunk_data = posts;
          })
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updatePosts();
  }

  bool checker(User user, String today_date) {
    if (mass_bunk_data.length != 0) {
      for (var i = 0; i < mass_bunk_data.length; i++) {
        if (mass_bunk_data[i].user_id == user.uid &&
            mass_bunk_data[i].posted_date == today_date) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
                child: RichText(
              overflow: TextOverflow.visible,
              strutStyle: StrutStyle(fontSize: 20),
              text: TextSpan(
                text: widget.sub.subjectName,
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ))
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.225,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.sub.total.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          'total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  )),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  onTap: () => confirm(context, 'Attended'),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black))),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.sub.attended.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            'attended',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    //color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () => confirm(context, 'Missed'),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.225,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.sub.missed.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          'missed',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  // color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        Text('Class Link',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        SizedBox(
          height: 100,
        ),
        checker(
                    widget.user,
                    (DateFormat('EEE,MMM d').format(DateTime.now()))
                        .toString()) ==
                false
            ? Text(
                'You Already Posted The Bunk',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black),
                ),
                elevation: 10,
                child: Text(
                  'Vote For Bunk',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                color: Colors.white,
                textColor: Colors.white,
                onPressed: () {
                  addbunk(context, widget.sub.subjectName);
                },
              )
      ],
    ));
  }
}
