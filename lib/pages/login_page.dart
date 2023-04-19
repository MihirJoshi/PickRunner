// ignore_for_file: unused_import, unnecessary_new, avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pickrunner/dashboard.dart';
import 'package:pickrunner/pages/f_pass.dart';
import 'package:pickrunner/pages/registration/personal.dart';
import 'package:pickrunner/widget/button_widget.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var email = "";
    var pass = "";
    var driverId = "";
    // Create a text controller and use it to retrieve the current value
    // of the TextField.
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final driverIdController = TextEditingController();

    userLogin() async {
      try {
        // Query the Firestore database for a driver document with matching driverId and password
        final driverDoc = await FirebaseFirestore.instance
            .collection('drivers')
            .where('driverId', isEqualTo: driverId)
            .where('pass', isEqualTo: pass)
            .limit(1)
            .get();

        // If a driver document is found, navigate to the Dashboard screen
        if (driverDoc.docs.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ),
          );
        } else {
          // If no matching driver document is found, display an error message to the user
          print('Invalid driver ID or password');
        }
      } catch (e) {
        // If there is an error, handle it appropriately (e.g. display an error message to the user)
        print(e.toString());
      }
    }

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    final driverField = TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      //autofocus: false,
      keyboardType:
          TextInputType.text, // Change keyboard type to accept text input
      controller:
          driverIdController, // Use a TextEditingController to capture the driver ID
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter driver ID';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(224, 243, 181, 183),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );

    final passwordField = TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      controller: passwordController,
      autofocus: false,
      obscureText: false,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');

        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(224, 243, 181, 183),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
    );
    Widget buildloginBtn() {
      return Center(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            width: 308,
            // ignore: deprecated_member_use
            child: Button_Widget(
                pressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      driverId = driverIdController.text;
                      pass = passwordController.text;
                    });
                    userLogin();
                  }
                },
                width: 270,
                text: "Login")),
      );
    }

    const ptext = Text("\t\t\t Driver ID ",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ));
    const passtext = Text(
      "\t\t\tPassword",
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
    const t = Text(
      "\t\t\t\t\t\t\t\t\t\t\t\t\tDoesn't has any account ?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 17),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36, 60, 36, 36),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                      child: Center(
                        child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 30, color: Colors.redAccent),
                          child: Text(
                            "LogIn",
                            style: TextStyle(fontSize: 25),
                          ),
                          /* child: AnimatedTextKit(
                            repeatForever: false,
                            totalRepeatCount: 1,
                            animatedTexts: [
                              RotateAnimatedText("Login",
                                  rotateOut: false)
                            ],
                          ),*/
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ptext,
                        const SizedBox(
                          height: 10.0,
                        ),
                        driverField,
                        const SizedBox(
                          height: 20.0,
                        ),
                        passtext,
                        const SizedBox(
                          height: 10.0,
                        ),
                        passwordField,
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => const fpass())),
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                    color: Color(0xff0E255D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        t,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Text("Don't have an account? ",textAlign: TextAlign.center,),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          const Personal_Details())),
                              child: const Text(
                                "Register Here",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff0E255D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        buildloginBtn(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
