import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/f_pass.dart';
import 'package:pickrunner/widget/button_widget.dart';

class spass extends StatefulWidget {
  const spass({ Key? key }) : super(key: key);

  @override
  _spassState createState() => _spassState();
}

class _spassState extends State<spass> {
  final _formKey = GlobalKey<FormState>();

  Widget buildloginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: 308,
      // ignore: deprecated_member_use
      child: Button_Widget(pressed: (){}, width: 270, text: "Proceed"),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    bool isHidden = false;

    void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
   
    final passwordField = TextFormField(
      style: TextStyle(color: Color(0xffEC121D)),
      autofocus: false,
      obscureText: !isHidden,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');

        if (value!.isEmpty) {
          return ("Password is required");
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
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            isHidden ? Icons.visibility : Icons.visibility_off,
            // color: Theme.of(context).primaryColorDark,
          ),
          onPressed: togglePasswordVisibility,
        ),
      ),
    );

    final CpasswordField = TextFormField(
    style: TextStyle(color: Color(0xffEC121D)),
    autofocus: false,
    obscureText: isHidden,
    keyboardType: TextInputType.visiblePassword,
    validator: (value) {
      RegExp regex = new RegExp(r'^.{6,}$');

      if (value!.isEmpty) {
        return ("Password is required ");
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
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
          suffixIcon:  IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               isHidden ? Icons.visibility: Icons.visibility_off,
              // color: Theme.of(context).primaryColorDark,
               ),
            onPressed: togglePasswordVisibility,
    ),
  ),);

    final ptext = Text("\t\t\t Re-Enter Password",
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
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => fpass())),
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
                              child: Text("Set Password"),
                          /*child: AnimatedTextKit(
                            repeatForever: false,
                            totalRepeatCount: 1,
                            animatedTexts: [
                              RotateAnimatedText("Set Password",
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
                        passtext,
                        SizedBox(
                          height: 10.0,
                        ),
                        passwordField,
                        SizedBox(height: 30),
                        ptext,
                        SizedBox(height: 10.0),
                        CpasswordField,
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