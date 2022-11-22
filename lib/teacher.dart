import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Admin"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          child:  AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(

                  curve: Curves.bounceInOut,
                  speed: Duration(microseconds: 150000),'HELLO ADMIN! \nWelcome back you\'ve been missed:)',
                  textStyle: const TextStyle(
                    color: Colors.black,
                    backgroundColor: Colors.blue,
                    fontSize: 40,
                  )),

            ],
            onTap: () {
              print("I am executing");
            },
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