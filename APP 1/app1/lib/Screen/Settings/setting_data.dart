import 'package:flutter/material.dart';

class Setting_data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.92,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.92,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.logout,
                  size: 30,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.92,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
            child: Text(
              'FEEDBACK',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.92,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.feedback,
                  size: 30,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Send Feedback',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.92,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.bug_report,
                  size: 30,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Report a Bug',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
