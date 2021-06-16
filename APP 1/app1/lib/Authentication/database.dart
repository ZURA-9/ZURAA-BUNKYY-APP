import 'package:app1/Models/subject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class database_service {
  static final databaseRefrence = FirebaseDatabase.instance.reference();
  //static var user1 = FirebaseAuth.instance.currentUser;
  static Future<List<Subject>> getAlldata(User user) async {
    DataSnapshot dataSnapshot = await databaseRefrence
        .child('User/')
        .child(user.uid)
        .child('Subjects/')
        .once();
    //print(dataSnapshot.value);
    List<Subject> getsubjectdata = [];
    if (dataSnapshot.value != null) {
      // print(dataSnapshot.value);
      dataSnapshot.value.forEach((key, value) {
        Subject subdata = createsubdata(value);
        getsubjectdata.add(subdata);
      });
    }
    // print('Iske Nicche');
    // print(getsubjectdata[1].teacherName);
    // print('Iske Uppar');
    return getsubjectdata;
  }

  static Subject createsubdata(record) {
    Map attributes = {
      'Subject Name': '',
      'Teacher Name': '',
      'Allias': '',
      'Total': null,
      'Attended': null,
      'Missed': null
    };
    record.forEach((key, value) => {attributes[key] = value});
    Subject sub = new Subject(
        subjectName: attributes['Subject Name'],
        teacherName: attributes['Teacher Name'],
        allias: attributes['Allias'],
        total: attributes['Total'],
        attended: attributes['Attended'],
        missed: attributes['Missed']);
    return sub;
  }

  static void updateData(
      {String subjectname, String change, Object value, User user1}) {
    databaseRefrence
        .child('User/')
        .child(user1.uid)
        .child('Subjects/')
        .child(subjectname)
        .child(change)
        .set(value);
  }
}
