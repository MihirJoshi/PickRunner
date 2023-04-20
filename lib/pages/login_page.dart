// ignore_for_file: unused_import, unnecessary_new, avoid_print, unused_element

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
    var password = "";
    // Create a text controller and use it to retrieve the current value
    // of the TextField.
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    userLogin() async {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print("No User Found for that Email");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "No User Found for that Email",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'wrong-password') {
          print("Wrong Password Provided by User");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Wrong Password Provided by User",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    }

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    final phone = TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      //autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Email';
        } else if (!value.contains('@')) {
          return 'Please Enter Valid Email';
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
                      email = emailController.text;
                      password = passwordController.text;
                    });
                    userLogin();
                  }
                },
                width: 270,
                text: "Login")),
      );
    }

    const ptext = Text("\t\t\tEmail ",
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
                        phone,
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
