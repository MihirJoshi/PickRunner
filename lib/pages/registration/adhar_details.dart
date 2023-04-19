// ignore_for_file: avoid_print, must_be_immutable

import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/pan_details.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/field_widget.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';
import 'package:pickrunner/widget/image_box.dart';

// ignore: camel_case_types
class Adhar_Details extends StatefulWidget {
  String name, address, mobNo, email, pinCode;
  File profilePath;
  Adhar_Details(
      {Key? key,
      required this.profilePath,
      required this.name,
      required this.email,
      required this.address,
      required this.mobNo,
      required this.pinCode})
      : super(key: key);

  @override
  State<Adhar_Details> createState() => _Adhar_DetailsState();
}

// ignore: camel_case_types
class _Adhar_DetailsState extends State<Adhar_Details> {
  TextEditingController adharNo = TextEditingController();
  File? _adharFront;
  File? _adharBack;

  ImagePicker image1 = ImagePicker();
  ImagePicker image2 = ImagePicker();

  // ignore: non_constant_identifier_names
  String url_adhar_front = "";
  // ignore: non_constant_identifier_names
  String url_adhar_back = "";

  //String pathAdharFront = " ";
  //String pathAdharBack = "";

  @override
  Widget build(BuildContext context) {
    print(widget.profilePath);
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
              const StepsHeader(
                small_text: "Steps: 3/7",
              ),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                  color: Colors.grey,
                  pre_text: "Adhar Details",
                  next_color: Colors.grey,
                  next_dash: "- - - - - - - >",
                  next_text: "PAN Details"),
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
                        title: "Enter Adhar Details",
                        size: 20,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Field_Widget(
                        valid: AutovalidateMode.always,
                        control: adharNo,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ("Enter Adhar Number(xxxx xxxx xxxx)format");
                          }
                          //reg expression for email
                          if (!RegExp("^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}")
                              .hasMatch(value)) {
                            return ("Please Enter the valid Adhar Number");
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter Adhar Card Number"),
                    const SizedBox(
                      height: 15,
                    ),
                    Image_Box(
                        text: "Adhar Card Front Page",
                        child_widget: _adharFront == null
                            ? const Center(
                                child: Text("Adhar Front Image Not Selected"),
                              )
                            : Image.file(_adharFront!),
                        pressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet1()));
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Image_Box(
                        text: "Adhar Card Back Page",
                        child_widget: _adharBack == null
                            ? const Center(
                                child: Text("Adhar Back Image Not Selected"),
                              )
                            : Image.file(_adharBack!),
                        pressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet2()));
                        }),
                    const SizedBox(
                      height: 28,
                    ),
                    Button_Widget(
                        pressed: () {
                          if (_adharFront != null && _adharBack != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PAN_Details(
                                          name: widget.name,
                                          address: widget.address,
                                          email: widget.email,
                                          mobNo: widget.mobNo,
                                          pinCode: widget.pinCode,
                                          profilePath: widget.profilePath,
                                          adharNo: adharNo.text,
                                          adharFrontPath: _adharFront!,
                                          adharBackPath: _adharBack!,
                                        )));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Adhar Photo not Selected");
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

  Widget bottomSheet1() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text("Choose Profile Image", style: TextStyle(fontSize: 20.0)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto1(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto1(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget bottomSheet2() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text("Choose Profile Image", style: TextStyle(fontSize: 20.0)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto2(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto2(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto1(ImageSource source) async {
    // ignore: deprecated_member_use
    final img = await image1.getImage(source: source);
    setState(() {
      _adharFront = File(img!.path);
    });
    //pathAdharFront = _adharFront!.path.toString();
  }

  void takePhoto2(ImageSource source) async {
    // ignore: deprecated_member_use
    final img = await image1.getImage(source: source);
    setState(() {
      _adharBack = File(img!.path);
    });
    //pathAdharBack = _adharBack!.path.toString();
  }
}
