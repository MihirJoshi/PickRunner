import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/bank_details.dart';

// ignore: camel_case_types
class Driving_Details extends StatefulWidget {
  const Driving_Details({Key? key}) : super(key: key);

  @override
  State<Driving_Details> createState() => _Driving_DetailsState();
}

class _Driving_DetailsState extends State<Driving_Details> {
  File? _driving;

  ImagePicker image4 = ImagePicker();

  String url_driving = "";

  @override
  Widget build(BuildContext context) {
    final next_button = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(187, 7, 207, 183),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 225,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Bank_Details()));
        },
        child: const Text(
          "Next",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ),
      ),
    );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Registration",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Steps: 5/7",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Driving Details",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text(
                      "- - - - - - - ->",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 22),
                    child: InkWell(
                      onTap: () {},
                      child: const Text("Bank Details",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2.0, 2.0), color: Colors.green)
                        ]),
                    height: 7,
                    width: 98,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2.0, 2.0), color: Colors.grey)
                        ]),
                    height: 7,
                    width: 100,
                  ),
                ],
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
                      child: const Text(
                        "Enter Driving Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.perm_identity_outlined),
                          labelText: 'Enter Driving License Number ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Driving License Photo",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: _driving == null
                                  ? Center(
                                      child: Text(
                                          "Driving License Photo Not Selected"),
                                    )
                                  : Image.file(_driving!),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) => bottomSheet4()));
                                },
                                child: Text("Select Image")),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      child: next_button,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, right: 10, left: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Note: If you don't have any vechile then skip it.",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ),
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

  Widget bottomSheet4() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Choose Profile Image", style: TextStyle(fontSize: 20.0)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto4(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              SizedBox(
                width: 25,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto4(ImageSource.gallery);
                },
                label: Text("Gallery"),
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
  }
}
