import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Expanded.dart';
import 'Student.dart';
import 'Teacher.dart';
import 'register.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isObscure3 = true;

  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromRGBO(26, 95, 195, 1.0),
        elevation: 0,
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: _buildImage('flutter.png', 100),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(

              color: Color.fromRGBO(26, 95, 195, 1),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 150.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Visibility(

                                    maintainSize: true,
                                    maintainAnimation: true,
                                    maintainState: true,
                                    visible: visible,
                                    child: Container(
                                        child: CircularProgressIndicator(

                                          color: Colors.white,
                                        ))),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Email',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Email cannot be empty";
                                    }
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please enter a valid email");
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    emailController.text = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: _isObscure3,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(_isObscure3
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure3 = !_isObscure3;
                                          });
                                        }),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Password',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return "Password cannot be empty";
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("please enter valid password min. 6 character");
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    passwordController.text = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),

                                SizedBox(
                                  height: 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(20.0))),
                                      elevation: 5.0,
                                      height: 40,
                                      onPressed: () {
                                        setState(() {
                                          visible = true;
                                        });
                                        signIn(
                                            emailController.text, passwordController.text);
                                      },
                                      child: Text(
                                        "      Login     ",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    // SizedBox(
                                    //   height: 50.0,
                                    // ),

                                    Center(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Row(

                                          children: [
                                            SizedBox(
                                                child: const DecoratedBox(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                              width: 170.5,
                                              height: 1,
                                            ),

                                            Text("  OR  "
                                              ,style: TextStyle(
                                                fontSize: 20,

                                              ),
                                            ),
                                            SizedBox(
                                                child: const DecoratedBox(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                              width: 170.5,
                                              height: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // SizedBox(
                                    //   height: 20,
                                    //
                                    // ),

                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      elevation: 5.0,
                                      height: 40,
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Register(),
                                          ),
                                        );
                                      },
                                      color: Colors.white,
                                      child: Text(
                                        "  Register  ",
                                        style: TextStyle(

                                          fontSize: 20,
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // MaterialButton(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.all(
                          //       Radius.circular(20.0),
                          //     ),
                          //   ),
                          //   elevation: 5.0,
                          //   height: 40,
                          //   onPressed: () {
                          //     Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => Register(),
                          //       ),
                          //     );
                          //   },
                          //   color: Colors.white,
                          //   child: Text(
                          //     "Register Now -->",
                          //     style: TextStyle(
                          //
                          //       fontSize: 20,
                          //     ),
                          //   ),
                          //
                          // ),

                          // Visibility(
                          //     maintainSize: true,
                          //     maintainAnimation: true,
                          //     maintainState: true,
                          //     visible: visible,
                          //     child: Container(
                          //         child: CircularProgressIndicator(
                          //       color: Colors.white,
                          //     ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(


                // color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                            curve: Curves.bounceInOut,
                            speed: Duration(microseconds: 555000),'Copyrights @',
                            textStyle: const TextStyle(
                                color:  Color.fromRGBO(26, 95, 195, 1.0),
                                fontSize: 10,
                               )),

                      ],

                    ),
                    Text(""
                        "<Moaz Wahba/\> <Abdalrahman Adel/\> <Ahmed Mohamed/\> <Mohmed Ali*/\> <Mohmed Adel/\>  ",style:TextStyle(
                      fontSize: 8.0,
                      color: Colors.black
                    ),



                        ),




                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Text(
                    //           "Moaz Wahba ",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 11,
                    //             color: Colors.blue[900],
                    //           ),
                    //         ),
                    //         Text(
                    //           "Abdalrahman Adel ",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 11,
                    //             color: Color.fromARGB(255, 223, 13, 15),
                    //           ),
                    //         ),
                    //         Text(
                    //           "Ahmed Mohamed ",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 11,
                    //             color: Colors.blue[900],
                    //           ),
                    //         ),
                    //         Text(
                    //           "Mohmed Ali ",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 11,
                    //             color: Color.fromARGB(255, 223, 13, 15),
                    //           ),
                    //         ),
                    //         Text(
                    //           "Mohmed Adel",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 11,
                    //             color: Colors.blue[900],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 150,
                    //         )
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Teacher") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Teacher(),
          ),
        );
        }else{
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Student(),
          ),
        );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }
}


