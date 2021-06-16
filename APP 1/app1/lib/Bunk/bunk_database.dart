import 'package:app1/Bunk/Model/Vote.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Bunk_Databse {
  static final databaseReference = FirebaseDatabase.instance.reference();
  // static var user = FirebaseAuth.instance.currentUser;
  static createData(
    Vote vote,
  ) {
    Map<String, dynamic> m1 = {
      'Subject': vote.subject,
      'Reason': vote.reason,
      'Date': vote.date,
      'UsersLiked': vote.usersLiked.toList(),
      'usersNotLiked': vote.usersNotLiked.toList(),
      'Id': vote.id,
      'User_Id': vote.user_id,
      'Posted_Date': vote.posted_date
    };
    databaseReference.child('Votes').child(vote.id).set(m1);
  }

  /*static updatePost(Vote vote) {
    Map<String, dynamic> m1 = {
      'Subject': vote.subject,
      'Reason': 'Checking',
      'Date': vote.date,
      'UsersLiked': vote.usersLiked.toList(),
    };

    databaseReference.child('Votes/').child(vote.id).update(m1);
  }*/

  static Future<List<Vote>> getAllVotes() async {
    DataSnapshot dataSnapshot = await databaseReference.child('Votes/').once();

    List<Vote> bunks = [];
    //in database all values are in JSON format..so we are converting it to post object
    if (dataSnapshot.value != null) {
      // value here is list of JSON..so for every single value in the list they have a key
      // and they have a value and we gonna use this key and value to convert it into
      // an object and add that to post list
      // key is unique id and value is "author" and "body"
      dataSnapshot.value.forEach((key, value) {
        Vote bunk = createVote(value);
        //bunk.id = (databaseReference.child('Votes/').child(key)).toString();
        bunks.add(bunk);
      });
    }
    return bunks;
  }

  static Vote createVote(record) {
    Map<String, dynamic> attributes = {
      'Subject': '',
      'Reason': '',
      'Date': '',
      'UsersLiked': [],
      'usersNotLiked': [],
      'Id': '',
      'User_Id': '',
      'Posted_Date': ''
    };
    // key is record e.g the value passed from getmessages()
    // key is the data inside of each unique id , value is value of each key
    // and we are setting the key of created Map using attributes[key] = value
    // // thats why we created the same key
    record.forEach((key, value) => {attributes[key] = value});
    Vote vote = new Vote(
        date: attributes['Date'],
        reason: attributes['Reason'],
        subject: attributes['Subject'],
        id: attributes['Id'],
        user_id: attributes['User_Id'],
        posted_date: attributes['Posted_Date']);

    // userLiked form database is a list..but for in post class userliked is set, so we are making set from the
    // userliked list coming from database
    vote.usersLiked = new Set.from(attributes['UsersLiked']);
    vote.usersNotLiked = new Set.from(attributes['usersNotLiked']);
    return vote;
  }
}
