import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Student"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          ) ,
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            child:  AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(

                    curve: Curves.bounceInOut,
                    speed: Duration(microseconds: 150000),'HELLO D.HATEM! \nWelcome back you\'ve been missed:)',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    )),

              ],
              onTap: () {
                print("I am executing");
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}