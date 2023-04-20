import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/driving_details.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/field_widget.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';
import 'package:pickrunner/widget/image_box.dart';

// ignore: camel_case_types
class PAN_Details extends StatefulWidget {
  String name, address, email, mobNo, pinCode, adharNo;
  File profilePath, adharFrontPath, adharBackPath;

  PAN_Details({Key? key, required this.name, required this.address, required this.email, required this.mobNo, required this.pinCode, required this.profilePath, required this.adharNo, required this.adharBackPath, required this.adharFrontPath}) : super(key: key);

  @override
  State<PAN_Details> createState() => _PAN_DetailsState();
}

// ignore: camel_case_types
class _PAN_DetailsState extends State<PAN_Details> {
  TextEditingController _panNo = TextEditingController();
  File? _panCard;

  ImagePicker image3 = ImagePicker();

  String url_pan = "";
  //String pathPAN = "";
  
  @override
  Widget build(BuildContext context) {
    
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
                small_text: "Steps: 4/7",
              ),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                  color: Colors.grey,
                  pre_text: "PAN Details",
                  next_color: Colors.grey,
                  next_dash: "- - - - - - - >",
                  next_text: "Driving Details"),
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
                      child: BigText(
                        title: "Enter PAN Details",
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
                      control: _panNo,
                        validate: (value){
                          if (value!.isEmpty) {
                              return ("Enter PAN Number(AAAAA0000A)format");
                            }
                            //reg expression for email
                            if (!RegExp(
                                    "[A-Z]{5}[0-9]{4}[A-Z]{1}")
                                .hasMatch(value)) {
                              return ("Please Enter the valid PAN Number");
                            }
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter PAN Card Number"),
                    const SizedBox(
                      height: 20,
                    ),
                    Image_Box(
                        text: "PAN Card Photo",
                        child_widget: _panCard == null
                            ? const Center(
                                child: Text("PAN Card Photo Not Selected"),
                              )
                            : Image.file(_panCard!),
                        pressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet3()));
                        }),
                    const SizedBox(
                      height: 28,
                    ),
                    Button_Widget(
                        pressed: () {
                          if (_panCard != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Driving_Details(name: widget.name, email: widget.email, address: widget.address, mobNo: widget.mobNo, pinCode: widget.pinCode, profilePath: widget.profilePath, adharNo: widget.adharNo, pathAdharFront: widget.adharFrontPath, pathAdharBack: widget.adharBackPath, panNo: _panNo.text, pathPAN: _panCard!,)));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Select PAN Card Photo");
                          }
                        },
                        width: 255,
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

  Widget bottomSheet3() {
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
                  takePhoto3(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto3(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto3(ImageSource source) async {
    // ignore: deprecated_member_use
    final img = await image3.getImage(source: source);
    setState(() {
      _panCard = File(img!.path);
    });
    //pathPAN = _panCard!.path.toString();
  }
}
