/*import 'package:app1/Models/subject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'confirmation.dart';

class Content extends StatefulWidget {
  final Subject sub;

  Content(
    this.sub,
  );

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final databaseRefrence = FirebaseDatabase.instance.reference();
  var user = FirebaseAuth.instance.currentUser;
  void updateData({String subjectname, String change, Object value}) {
    databaseRefrence
        .child('User/')
        .child(user.uid)
        .child('Subjects/')
        .child(subjectname)
        .child(change)
        .set(value);
  }

  int val_attend = 0;
  int val_missed = 0;
  int val_total = 0;
  Future readData(String change) async {
    await databaseRefrence
        .child('User/')
        .child(user.uid)
        .child('Subjects/')
        .child(widget.sub.subjectName)
        .child(change)
        .once()
        .then((snapshot) {
      setState(() {
        if (change == 'Attended') {
          val_attend == snapshot.value;
        } else if (change == 'Missed') {
          val_missed == snapshot.value;
        } else if (change == 'Total') {
          val_total == snapshot.value;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readData('Attended');
    readData('Missed');
    readData('Total');
  }

  void counting(String type) {
    setState(() {
      if (type == 'Attended') {
        val_attend++;
        updateData(
            subjectname: widget.sub.subjectName,
            change: type,
            value: val_attend);
      }

      if (type == 'Missed') {
        val_missed++;
        updateData(
            subjectname: widget.sub.subjectName,
            change: type,
            value: val_missed);
      }
      val_total++;
      updateData(
          subjectname: widget.sub.subjectName,
          change: 'Total',
          value: val_total);
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          widget.sub.subjectName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
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
        RaisedButton(
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
          onPressed: () {},
        )
      ],
    ));
  }
}*/
