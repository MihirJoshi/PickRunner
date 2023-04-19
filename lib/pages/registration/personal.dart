// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/profile_pic.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/field_widget.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';

// ignore: camel_case_types
class Personal_Details extends StatefulWidget {
  const Personal_Details({Key? key}) : super(key: key);

  @override
  State<Personal_Details> createState() => _Personal_DetailsState();
}

// ignore: camel_case_types
class _Personal_DetailsState extends State<Personal_Details> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobNo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _pinCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 223, 221),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              const StepsHeader(
                small_text: "Steps: 1/7",
              ),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                pre_text: "Personal Details",
                next_dash: "- - - - - - - >",
                next_text: "Profile Picture",
              ),
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
                height: 650,
                width: 500,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: const BigText(
                        title: "Enter Personal Details",
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Field_Widget(
                        valid: AutovalidateMode.always,
                        control: _name,
                        validate: (value) {
                          RegExp regex = new RegExp(r'^.{2,}$');

                          if (value!.isEmpty) {
                            return ("Enter the Name");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Name(Min. 2 Character)");
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.person,
                        label: "Enter Name"),
                    const SizedBox(
                      height: 15,
                    ),
                    Field_Widget(
                        valid: AutovalidateMode.always,
                        control: _mobNo,
                        validate: (value) {
                          RegExp regex = new RegExp(r'^[6-9]\d{9}$');
                          if (value!.isEmpty) {
                            return ("Please Enter the Mobile No.");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Mobile Number");
                          }
                          return null;
                        },
                        type: TextInputType.phone,
                        icon: Icons.phone,
                        label: "Enter Mobile No."),
                    const SizedBox(
                      height: 15,
                    ),
                    Field_Widget(
                        valid: AutovalidateMode.always,
                        control: _email,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ("Enter the Email");
                          }
                          //reg expression for email
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please Enter the valid Email");
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        icon: Icons.email_outlined,
                        label: "Enter Email"),
                    const SizedBox(
                      height: 15,
                    ),
                    Field_Widget(
                        valid: AutovalidateMode.always,
                        control: _address,
                        validate: (value) {
                          RegExp regex = new RegExp(r'^.{5,}$');

                          if (value!.isEmpty) {
                            return ("Enter the Address");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Address(Min. 5 Character)");
                          }
                          return null;
                        },
                        type: TextInputType.multiline,
                        icon: Icons.location_on,
                        label: "Enter Address"),
                    const SizedBox(
                      height: 15,
                    ),
                    Field_Widget(
                        valid: AutovalidateMode.always,
                        control: _pinCode,
                        validate: (value) {
                          RegExp regex = new RegExp(
                              '([1-9]{1}[0-9]{5}|[1-9]{1}[0-9]{3}\\s[0-9]{3})');

                          if (value!.isEmpty) {
                            return ("Enter the PinCode");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid PinCode(000000)");
                          }
                          return null;
                        },
                        type: TextInputType.number,
                        icon: Icons.code_outlined,
                        label: "Enter PinCode"),
                    const SizedBox(
                      height: 28,
                    ),
                    Button_Widget(
                      pressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile_Pic(
                                      name: _name.text,
                                      address: _address.text,
                                      email: _email.text,
                                      mobNo: _mobNo.text,
                                      pinCode: _pinCode.text,
                                    )));
                      },
                      text: "Next",
                      width: 225,
                    )
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
