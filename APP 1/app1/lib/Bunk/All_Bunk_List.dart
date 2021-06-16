import 'package:app1/Models/gallery_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Model/Vote.dart';

class AllBunks extends StatefulWidget {
  final List<Vote> bunksList;
  final User user;
  AllBunks(this.bunksList, this.user);
  @override
  _AllBunksState createState() => _AllBunksState();
}

class _AllBunksState extends State<AllBunks> {
  final databaseReference = FirebaseDatabase.instance.reference();

  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  void dislike(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  void delete(String id) {
    databaseReference.child('Votes/').child(id).remove();
  }

  void deletebunk(String id) {
    setState(() {
      widget.bunksList.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.bunksList.length,
      itemBuilder: (context, index) {
        var post = this.widget.bunksList[index];
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text(post.reason),
                subtitle: Text(
                  post.subject,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              )),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(post.usersLiked.length.toString(),
                        style: TextStyle(fontSize: 20)),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () => this.like(
                            () => post.likeBunk(widget.user, post),
                          ),
                      color: post.usersLiked.contains(widget.user.uid)
                          ? Colors.green
                          : Colors.black),
                  Container(
                    child: Text(post.usersNotLiked.length.toString(),
                        style: TextStyle(fontSize: 20)),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                      icon: Icon(Icons.thumb_down),
                      onPressed: () => this.dislike(
                            () => post.dislikeBunk(widget.user, post),
                          ),
                      color: post.usersNotLiked.contains(widget.user.uid)
                          ? Colors.green
                          : Colors.black),
                  Row(
                    children: [
                      Text(post.date),
                      widget.user.uid == post.user_id
                          ? IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                delete(post.id);
                                deletebunk(post.id);
                              },
                            )
                          : Icon(Icons.verified)
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
