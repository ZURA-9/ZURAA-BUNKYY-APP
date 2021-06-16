import 'package:app1/Screen/Homescreen.dart';
import 'package:app1/main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import 'registeration.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/category - loginScreen';
  TextEditingController emailTextEditingController = TextEditingController();
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
                height: 35,
              ),
              Text(
                'Login TO Our App',
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
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "Email"),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24),
                      ),
                      onPressed: () {
                        /* if (!emailTextEditingController.text.contains("@")) {
                          Fluttertoast.showToast(
                              msg: "Enter Valid email address ");
                        } else if (passwordTextEditingController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Password is mandatory");
                        }*/ // else {
                        loginAndAuthenticateUser(context);
                        // }
                      },
                    )
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      RegistertionScreen.routeName,
                    );
                  },
                  child: Text("Do not have an Account ? Register Here"))
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError(
      (errMsg) {
        //  Fluttertoast.showToast(msg: "Error: " + errMsg.toString());
      },
    ))
        .user;

    if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.of(context).pushReplacementNamed(
            HomeScreen.routeName,
          );
          //  Fluttertoast.showToast(msg: "YOu Are Logged In");
        } else {
          _firebaseAuth.signOut();
          //  Fluttertoast.showToast(
          //  msg: "No record exist for this user . Please create new account");
        }
      });
    } else {
      // Fluttertoast.showToast(msg: "Error Occured , can not Signed in");
    }
  }
}
