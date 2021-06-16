import 'package:app1/Login/Signup/login.dart';
import 'package:app1/Models/subject.dart';
import 'package:app1/Models/subject_data.dart';
import 'package:app1/Screen/Homescreen.dart';
import 'package:app1/main.dart';
import 'package:app1/newfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class RegistertionScreen extends StatelessWidget {
  final List<Subject> information = abcd();
  static const routeName = '/category - register';
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController rollNoTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Register to our App',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: rollNoTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Roll No",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      color: Colors.yellow,
                      textColor: Colors.white,
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24)),
                      onPressed: () {
                        /* if (nameTextEditingController.text.length < 4) {
                          Fluttertoast.showToast(
                              msg: "Name Must Be Atleast 3 CHaracters");
                        } else if (!emailTextEditingController.text
                            .contains("@")) {
                          Fluttertoast.showToast(
                              msg: "Enter Valid email address ");
                        } else if (phoneTextEditingController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Phone Number is Mandatory");
                        } else if (passwordTextEditingController.text.length <
                            7) {
                          Fluttertoast.showToast(
                              msg: "Password Must Be Atleast 6 CHaracters");
                        }*/ // else {
                        registerNewUser(context);
                        // }
                      },
                    ),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: Text("Already have an Account? Login Here"))
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      // Fluttertoast.showToast(msg: "Error: " + errMsg.toString());
      print(errMsg);
    }))
        .user;
    if (firebaseUser != null) {
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "rollno": rollNoTextEditingController.text,
        "phone": phoneTextEditingController.text.trim(),
        "password": passwordTextEditingController.text,
      };

      userRef.child(firebaseUser.uid).set(userDataMap);
      for (var i = 0; i < information.length; i++) {
        Map subjectdata = {
          "Subject Name": information[i].subjectName,
          "Teacher Name": information[i].teacherName,
          "Allias": information[i].allias,
          "Total": information[i].total,
          "Attended": information[i].attended,
          "Missed": information[i].missed,
        };
        userRef
            .child(firebaseUser.uid)
            .child('Subjects/')
            .child(information[i].subjectName)
            .set(subjectdata);
      }
      Navigator.of(context).pushReplacementNamed(
        HomeScreen.routeName,
      );
      ;
    } else {
      // Fluttertoast.showToast(msg: "New User Cannot Created");
    }
  }
}
