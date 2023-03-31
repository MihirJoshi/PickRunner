
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pickrunner/pages/f_pass.dart';
import 'package:pickrunner/pages/registration/personal.dart';
import 'package:pickrunner/widget/button_widget.dart';

class Log extends StatefulWidget {
  const Log({ Key? key }) : super(key: key);

  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    final phone = TextFormField(
      //autofocus: false,
      keyboardType: TextInputType.phone,
      

      validator: (value) {
        RegExp regex = new RegExp(r'^[6-9]\d{9}$');
        if (value!.isEmpty) {
          return ("Phone number is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Phone no.(Min. 10 Character)");
        }
        return null;
      },
      onSaved: (value) {},
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(224, 243, 181, 183),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
    );

    final passwordField = TextFormField(
      style: TextStyle(color: Color(0xffEC121D)),
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
      onSaved: (value) {},
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(224, 243, 181, 183),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
    );
    Widget buildloginBtn() {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: 308,
          // ignore: deprecated_member_use
          child: Button_Widget(pressed: (){}, width: 270, text: "Login")
        ),
      );
    }

    final ptext = Text("\t\t\tPhone Number",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ));
    final passtext = Text(
      "\t\t\tPassword",
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
    final t = Text(
      "\t\t\t\t\t\t\t\t\t\t\t\t\tDoesn't has any account ?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 17),
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                              fontSize: 30, color: Colors.redAccent),
                              child: Text("Login", style: TextStyle(fontSize: 25),),
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
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/images/logo.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ptext,
                        SizedBox(
                          height: 10.0,
                        ),
                        phone,
                        SizedBox(
                          height: 30.0,
                        ),
                        passtext,
                        SizedBox(
                          height: 10.0,
                        ),
                        passwordField,
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => fpass())),
                              child: Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                    color: Color(0xff0E255D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        t,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Text("Don't have an account? ",textAlign: TextAlign.center,),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => Personal_Details())),
                              child: Text(
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
                        SizedBox(
                          height: 30.0,
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