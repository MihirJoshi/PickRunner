import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrunner/dashboard.dart';
import 'package:pickrunner/models/driver_model.dart';
import 'package:pickrunner/pages/login_page.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';

// ignore: camel_case_types
class Password_Details extends StatefulWidget {
  String name, address, email, mobNo, pinCode, adharNo, panNo, lNo, accNo, accType, branchNo, ifscCode;
  File profilePath,  adharFrontPath, adharBackPath, pathPAN;
  File? pathDriving;
  Password_Details({Key? key, required this.name, required this.address, required this.email, required this.mobNo, required this.pinCode, required this.profilePath, required this.adharNo, required this.adharFrontPath, required this.adharBackPath, required this.panNo, required this.pathPAN, this.lNo = " ", this.pathDriving, required this.accNo, required this.accType, required this.branchNo, required this.ifscCode}) : super(key: key);

  @override
  State<Password_Details> createState() => _Password_DetailsState();
}

// ignore: camel_case_types
class _Password_DetailsState extends State<Password_Details> {
  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();
  bool _isObscure = true;
  bool _reObscure = true;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String profileUrl = "";
  String adharFrontUrl = "";
  String adharBackUrl = "";
  String panUrl = "";
  String lUrl = "";

  // string for displaying the error Message
  String? errorMessage;
  
  @override
  Widget build(BuildContext context) {
    String email = widget.email;
    print(widget.accNo+ widget.accType + widget.branchNo + widget.ifscCode);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 223, 221),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {

          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              StepsHeader(
                small_text: "Steps: 7/7",
              ),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                  color: Colors.green,
                  pre_text: "Password Details",
                  next_color: Colors.green,
                  next_dash: " - - - - - - - - >",
                  next_text: "Completed ✔"),
              const SizedBox(
                height: 35,
              ),
              Container(
                margin: const EdgeInsets.only(left: 1, right: 1),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2.0, 2.0),
                          color: Color.fromARGB(147, 250, 250, 250))
                    ]),
                height: 540,
                width: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25),
                        alignment: Alignment.topLeft,
                        child: BigText(
                            title: "Enter Password Credentials",
                            size: 20,
                            weight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: BigText(
                            title:
                                "1. Set Password with length of min. 6 Charecters",
                            size: 18,
                            weight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: BigText(
                            title:
                                "2. Password must have atleast 1 number and 1 special charecter",
                            size: 18,
                            weight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          controller: _password,
                          autofocus: false,
                          validator: (value) {
                            RegExp regex = RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)');
                
                            if (value!.isEmpty) {
                              return ("Please Enter your Password");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Pasword with Capital, Small, Numbers and Special Charecters");
                            }
                            return null;
                          },
                          onSaved: (value) {},
                          autovalidateMode: AutovalidateMode.always,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.password_outlined),
                            labelText: 'Enter Password ',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          controller: _rePassword,
                          autofocus: false,
                          validator: (value) {
                            RegExp regex = RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)');
                
                            if (value!.isEmpty) {
                              return ("Please Re-Enter your Password");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Pasword with Capital, Small, Numbers and Special Charecters");
                            }
                            return null;
                          },
                          onSaved: (value) {},
                          autovalidateMode: AutovalidateMode.always,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.password_outlined),
                            labelText: 'Re-Enter Password ',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _reObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _reObscure = !_reObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Button_Widget(pressed: () {
                        if(_password.text == _rePassword.text)
                        {
                          signUp(email, _password.text);
                          print(profileUrl);
                        }
                        else{
                          Fluttertoast.showToast(msg: "Password is not Match!!");
                        }
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                      }, width: 255, text: "Next")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirbase()})
            .catchError((e) => {
          Fluttertoast.showToast(msg: e!.message)
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirbase() async {
    // calling firestore
    // calling doctor model
    // sending the values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? driver = _auth.currentUser;

    DriverModel driverModel = DriverModel();

    String imgId1 = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFile1 =
        FirebaseStorage.instance.ref().child('images').child('users$imgId1');
    UploadTask profile_task = imageFile1.putFile(widget.profilePath);

    String imgId2 = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFile2 =
        FirebaseStorage.instance.ref().child('images').child('users$imgId2');
    UploadTask adharFront_task = imageFile2.putFile(widget.adharFrontPath);

    String imgId3 = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFile3 =
        FirebaseStorage.instance.ref().child('images').child('users$imgId3');
    UploadTask adharBack_task = imageFile3.putFile(widget.adharBackPath as File);

    String imgId4 = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFile4 =
        FirebaseStorage.instance.ref().child('images').child('users$imgId4');
    UploadTask pan_Task = imageFile4.putFile(widget.pathPAN);

    String imgId5 = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFile5 =
        FirebaseStorage.instance.ref().child('images').child('users$imgId5');
    UploadTask lTask = imageFile5.putFile(widget.pathDriving!);
    // ignore: unused_local_variable
    TaskSnapshot profileSnapshot = await profile_task;
    TaskSnapshot adharFrontSnapshot = await adharFront_task;
    TaskSnapshot adharBackSnapshot = await adharBack_task;
    TaskSnapshot panSnapshot = await pan_Task;
    TaskSnapshot lSnapshot = await lTask;

    profileUrl = await profileSnapshot.ref.getDownloadURL();
    adharFrontUrl = await adharFrontSnapshot.ref.getDownloadURL();
    adharBackUrl = await adharBackSnapshot.ref.getDownloadURL();
    panUrl = await panSnapshot.ref.getDownloadURL();
    lUrl = await lSnapshot.ref.getDownloadURL();
    // writing all values

    driverModel.email = driver!.email;
    driverModel.uid = driver.uid;
    driverModel.name = widget.name;
    driverModel.address = widget.address;
    driverModel.pinCode = widget.pinCode;
    driverModel.mobNo =widget.mobNo;
    driverModel.picPhoto = profileUrl;
    driverModel.adharNo = widget.adharNo;
    driverModel.adharFrontPhoto = adharFrontUrl;
    driverModel.adharBackPhoto = adharBackUrl;
    driverModel.panNo = widget.panNo;
    driverModel.panPhoto = panUrl;
    driverModel.lNo = widget.lNo;
    driverModel.lPhoto = lUrl;
    driverModel.accNo = widget.accNo;
    driverModel.ifscNo = widget.ifscCode;
    driverModel.accType = widget.accType;
    driverModel.branchName = widget.branchNo;
    driverModel.pass = _password.text;
    driverModel.rePass = _rePassword.text;
    driverModel.type = "Driver";

    // for downloading url of image

    await firebaseFirestore
        .collection("drivers")
        .doc(driver.uid)
        .set(driverModel.toMap());
    //print(url);
    Fluttertoast.showToast(msg: "Congratulations !!");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Log()),
        (route) => false);
  }

  void _resetform() {
    _formKey.currentState?.reset();
  }
}
