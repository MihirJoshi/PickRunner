// ignore_for_file: unused_import, camel_case_types, unnecessary_new, unused_local_variable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickrunner/pages/login_page.dart';
import 'package:pickrunner/pages/s_pass.dart';
import 'package:pickrunner/widget/button_widget.dart';

class fpass extends StatefulWidget {
  const fpass({Key? key}) : super(key: key);

  @override
  _fpassState createState() => _fpassState();
}

class _fpassState extends State<fpass> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final phone = TextFormField(
      //autofocus: false,
      keyboardType: TextInputType.phone,

      validator: (value) {
        RegExp regex = new RegExp(r'^[6-9]\d{9}$');
        if (value!.isEmpty) {
          return ("Phone number is required ");
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
        fillColor: const Color.fromARGB(224, 243, 181, 183),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
    );

    Widget buildOTPBtn() {
      return Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.titleLarge,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.titleLarge,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.titleLarge,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.titleLarge,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget buildloginBtn() {
      return Center(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            width: 308,
            // ignore: deprecated_member_use
            child: Button_Widget(
                pressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const spass()));
                },
                width: 270,
                text: "Verify")),
      );
    }

    const f = Text(
      "Forgot Password",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 30,
          color: Colors.black,
          //color: Color(0xffEC121D),
          fontWeight: FontWeight.bold),
    );
    const ptext = Text("\t\t\tEnter Phone Number",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ));
    var inputDecoration = const InputDecoration(
      filled: true,
    );
    const passtext = Text(
      "\t\t\t Enter the 4- digit password",
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Log())),
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
                    const SizedBox(
                      height: 50,
                      child: Center(
                        child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 30, color: Colors.redAccent),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(fontSize: 25),
                          ),
                          /* child: AnimatedTextKit(
                            repeatForever: false,
                            totalRepeatCount: 1,
                            animatedTexts: [
                              RotateAnimatedText("Forgot Password",
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
                    const SizedBox(
                      height: 30.0,
                    ),
                    const SizedBox(height: 30.0),
                    //f,
                    const SizedBox(
                      height: 30.0,
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
                          height: 30.0,
                        ),
                        passtext,
                        const SizedBox(
                          height: 10.0,
                        ),
                        buildOTPBtn(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        buildloginBtn(),
                      ],
                    )
                  ],
                ),
              ),
            )),
      )),
    );
  }
}
