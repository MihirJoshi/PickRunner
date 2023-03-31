import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/bank_details.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/field_widget.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';
import 'package:pickrunner/widget/image_box.dart';

// ignore: camel_case_types
class Driving_Details extends StatefulWidget {
  String name, address, email, mobNo, pinCode,adharNo, panNo;
  File profilePath,  pathAdharFront, pathAdharBack, pathPAN;
  Driving_Details({Key? key, required this.name, required this.address, required this.email, required this.mobNo, required this.pinCode, required this.profilePath, required this.adharNo, required this.pathAdharFront, required this.pathAdharBack, required this.panNo, required this.pathPAN}) : super(key: key);

  @override
  State<Driving_Details> createState() => _Driving_DetailsState();
}

// ignore: camel_case_types
class _Driving_DetailsState extends State<Driving_Details> {
  TextEditingController _lNo = TextEditingController();
  File? _driving;

  ImagePicker image4 = ImagePicker();

  // ignore: non_constant_identifier_names
  String url_driving = "";
  //String pathDriving = "";

  @override
  Widget build(BuildContext context) {
    //print(widget.pathAdharBack + widget.panNo + widget.pathPAN);
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
                small_text: "Steps: 5/7",
              ),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                  color: Colors.grey,
                  pre_text: "Driving Details",
                  next_color: Colors.grey,
                  next_dash: "- - - - - - - - >",
                  next_text: "Bank Details"),
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
                          title: "Enter Driving Details",
                          size: 20,
                          weight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Field_Widget(
                      valid: AutovalidateMode.onUserInteraction,
                      control: _lNo,
                        validate: (value){
                          if (value!.isEmpty) {
                              return ("Enter Driving License Number");
                            }
                            //reg expression for email
                            if (!RegExp(
                                    "^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}")
                                .hasMatch(value)) {
                              return ("Please Enter the valid Driving License Number");
                            }
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Format: AB-0000000000000"),
                    const SizedBox(
                      height: 20,
                    ),
                    Image_Box(
                        text: "Driving License Photo",
                        child_widget: _driving == null
                            ? const Center(
                                child:
                                    Text("Driving License Photo Not Selected"),
                              )
                            : Image.file(_driving!),
                        pressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet4()));
                        }),
                    const SizedBox(
                      height: 28,
                    ),
                    Button_Widget(
                        pressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bank_Details(name: widget.name, address: widget.address, email: widget.email, mobNo: widget.mobNo, pinCode: widget.pinCode, profilePath: widget.profilePath, adharNo: widget.adharNo, adharFrontPath: widget.pathAdharFront, adharBackPath: widget.pathAdharBack, panNo: widget.panNo, pathPAN: widget.pathPAN, lNo: _lNo.text, pathDriving: _driving!,)));
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

  Widget bottomSheet4() {
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
                  takePhoto4(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto4(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto4(ImageSource source) async {
    // ignore: deprecated_member_use
    final img = await image4.getImage(source: source);
    setState(() {
      _driving = File(img!.path);
    });
    //pathDriving = _driving!.path.toString();

  }
}
