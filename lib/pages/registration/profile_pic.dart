import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/adhar_details.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/circle_avatar.dart.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';

// ignore: camel_case_types
class Profile_Pic extends StatefulWidget {
  String name, mobNo, email, address, pinCode;
  Profile_Pic({Key? key, required this.name, required this.address, required this.email, required this.mobNo, required this.pinCode}) : super(key: key);

  @override
  State<Profile_Pic> createState() => _Profile_PicState();
}

// ignore: camel_case_types
class _Profile_PicState extends State<Profile_Pic> {
  File? _imageFile;

  ImagePicker image = ImagePicker();

  String url = "";
  //String path = "";

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
                small_text: "Steps: 2/7",
              ),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                  pre_text: "Profile Picture",
                  next_dash: "- - - - - - >",
                  next_text: "Adhar Details"),
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
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: BigText(
                        title: "Add Profile Picture",
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: BigText(
                          title: "1. Add Profile Picture with proper lights",
                          size: 18,
                          weight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 22, right: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: BigText(
                            title:
                                "2. Don't cover your face with masks, hats and sunglasses",
                            size: 18,
                            weight: FontWeight.w600,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 22, right: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: BigText(
                          title: "3. Picture will be visible to clients",
                          size: 18,
                          weight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Circle_Avatar(
                        image_provide: _imageFile == null
                            ? const NetworkImage("https://tse4.mm.bing.net/th?id=OIP.SzixlF6Io24jCN67HHZulAHaLH&pid=Api&P=0")
                            : FileImage(File(_imageFile!.path))
                                as ImageProvider,
                        tap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()));
                        }),
                    const SizedBox(
                      height: 28,
                    ),
                    Button_Widget(
                      text: "Next",
                      width: 225,
                      pressed: () async {
                        //print(_imageFile == null);
                        if (_imageFile == null) {
                          Fluttertoast.showToast(
                              msg: "Profile Image not selected");
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Adhar_Details(profilePath: _imageFile!, name: widget.name, mobNo: widget.mobNo, address: widget.address, email: widget.email, pinCode: widget.pinCode,)));
                        }
                      },
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

  Widget bottomSheet() {
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
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final img = await image.getImage(source: source);
    setState(() {
      _imageFile = File(img!.path);
    });
    /*String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFile =
        FirebaseStorage.instance.ref().child('images').child('users$imgId');
    UploadTask task = imageFile.putFile(_imageFile!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();*/
    print(_imageFile);
    
   
    //path = _imageFile!.path.toString();
  }
}
