import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrunner/pages/registration/password.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/field_widget.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';

// ignore: camel_case_types
class Bank_Details extends StatefulWidget {
  String name, address, email, mobNo, pinCode, adharNo, panNo, lNo;
  File profilePath, adharFrontPath, adharBackPath, pathPAN;
  File? pathDriving;
  Bank_Details({Key? key, required this.name, required this.email, required this.address, required this.mobNo, required this.pinCode, required this.profilePath, required this.adharNo, required this.adharFrontPath, required this.adharBackPath, required this.panNo, required this.pathPAN, this.lNo = "", this.pathDriving}) : super(key: key);

  @override
  State<Bank_Details> createState() => _Bank_DetailsState();
}

// ignore: camel_case_types
class _Bank_DetailsState extends State<Bank_Details> {
  TextEditingController _accType = TextEditingController();
  TextEditingController _ifscCode = TextEditingController();
  TextEditingController _branchNo = TextEditingController();
  TextEditingController _accNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    // ignore: non_constant_identifier_names
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 223, 221),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
                small_text: "Steps: 6/7",
              ),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                  color: Colors.grey,
                  pre_text: "Bank Details",
                  next_color: Colors.grey,
                  next_dash: " - - - - - - - - >",
                  next_text: "Password Details"),
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
                height: 560,
                width: 500,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: BigText(
                          title: "Enter Bank Details",
                          size: 20,
                          weight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Field_Widget(
                      valid: AutovalidateMode.always,
                      control: _accNo,
                        validate: (value){
                          if (value!.isEmpty) {
                              return ("Enter Account Number");
                            }
                            //reg expression for email
                            if (!RegExp(
                                    "^[0-9]{9,18}")
                                .hasMatch(value)) {
                              return ("Please Enter the Account Number");
                            }
                            return null;
                        },
                        type: TextInputType.number,
                        icon: Icons.account_balance_outlined,
                        label: "Enter Account Number"),
                    const SizedBox(
                      height: 15,
                    ),
                      Field_Widget(
                        valid: AutovalidateMode.always,
                        control: _ifscCode,
                        validate: (value){
                          if (value!.isEmpty) {
                              return ("Enter IFSC Code(ABCD0123456) format");
                            }
                            //reg expression for email
                            if (!RegExp(
                                    "^[A-Z]{4}0[A-Z0-9]{6}")
                                .hasMatch(value)) {
                              return ("Please Enter IFSC Code(ABCD0123456)");
                            }
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.code_outlined,
                        label: "Enter IFSC Code"),
                    const SizedBox(
                      height: 15,
                    ),
                     Field_Widget(
                      valid: AutovalidateMode.always,
                      control: _branchNo,
                        validate: (value){
                          if (value!.isEmpty) {
                              return ("Enter Branch Name");
                            }
                            //reg expression for email
                            if (!RegExp(
                                    "^.{2,}")
                                .hasMatch(value)) {
                              return ("Please Enter Branch Name");
                            }
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.near_me,
                        label: "Enter Branch Name"),
                    const SizedBox(
                      height: 15,
                    ),
                     Field_Widget(
                      valid: AutovalidateMode.always,
                      control: _accType,
                        validate: (value){
                          if (value!.isEmpty) {
                              return ("Enter Account Type");
                            }
                            //reg expression for email
                            if (!RegExp(
                                    "^.{2,}")
                                .hasMatch(value)) {
                              return ("Please Enter Account Type");
                            }
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.type_specimen_outlined,
                        label: "Enter Account Type"),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Button_Widget(
                        pressed: () {
                          if(_accNo == " " && _accType == " " && _branchNo == " " && _ifscCode == " ")
                          {
                              Fluttertoast.showToast(msg: "Please fill the Information");
                          }
                          else
                          {
                            print("enter");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Password_Details(name: widget.name, address: widget.address, email: widget.email, mobNo: widget.mobNo, pinCode: widget.pinCode, profilePath: widget.profilePath, adharNo: widget.adharNo, adharFrontPath: widget.adharFrontPath, adharBackPath: widget.adharBackPath, panNo: widget.panNo, pathPAN: widget.pathPAN, lNo: widget.lNo, pathDriving: widget.pathDriving, accNo: _accNo.text, accType: _accType.text, branchNo: _branchNo.text, ifscCode: _ifscCode.text,)));
                          }
                          
                        },
                        width: 225,
                        text: "Next")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
