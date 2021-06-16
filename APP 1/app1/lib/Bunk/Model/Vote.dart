import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import '../bunk_database.dart';

//var user = FirebaseAuth.instance.currentUser;
final databaseReference = FirebaseDatabase.instance.reference();

class Vote {
  String subject;
  String reason;
  Set usersLiked = {};
  Set usersNotLiked = {};
  String date;
  String id;
  User user;
  String user_id;
  String posted_date;

  Vote(
      {this.subject,
      this.reason,
      this.date,
      this.id,
      this.user_id,
      this.posted_date});

  void likeBunk(User user, Vote vote) {
    if (this.usersLiked.contains(user.uid)) {
      this.usersLiked.remove(user.uid);
    } else {
      this.usersLiked.add(user.uid);
      if (this.usersNotLiked.contains(user.uid)) {
        this.usersNotLiked.remove(user.uid);
      }
    }
    this.updatePost(vote);
  }

  void dislikeBunk(User user, Vote vote) {
    if (this.usersNotLiked.contains(user.uid)) {
      this.usersNotLiked.remove(user.uid);
    } else {
      this.usersNotLiked.add(user.uid);
      if (this.usersLiked.contains(user.uid)) {
        this.usersLiked.remove(user.uid);
      }
    }
    this.updatePost(vote);
  }

  updatePost(Vote vote) {
    Map<String, dynamic> m1 = {
      'Subject': vote.subject,
      'Reason': vote.reason,
      'Date': vote.date,
      'UsersLiked': vote.usersLiked.toList(),
      'usersNotLiked': vote.usersNotLiked.toList()
    };

    databaseReference.child('Votes/').child(vote.id).update(m1);
  }
  /* void setId(DatabaseReference id) {
    this._id = id;
  }*/
}
