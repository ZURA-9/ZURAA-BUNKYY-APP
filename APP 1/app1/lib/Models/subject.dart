import 'package:firebase_database/firebase_database.dart';

class Subject {
  String subjectName;
  String teacherName;
  String allias;
  int attended;
  int missed;
  int total;

  Subject(
      {this.subjectName,
      this.teacherName,
      this.allias,
      this.attended,
      this.missed,
      this.total});
}
