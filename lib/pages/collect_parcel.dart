

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickrunner/pages/desti_route.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/field_widget.dart';
import 'package:pickrunner/widget/image_box.dart';

// ignore: must_be_immutable
class CollectParcel extends StatefulWidget {
  String orderId, name, destiName, mobNo, destimobNo, email, driverUid, orderUid;
  double price, d_lat, d_lng, p_lat, p_lng;
  CollectParcel({Key? key, required this.destiName, required this.destimobNo, required this.email, required this.mobNo, required this.name, required this.orderId, required this.price, required this.driverUid, required this.orderUid, required this.d_lat, required this.d_lng, required this.p_lat, required this.p_lng}) : super(key: key);

  @override
  State<CollectParcel> createState() => _CollectParcelState();
}

class _CollectParcelState extends State<CollectParcel> {
  File? _parcel;

  ImagePicker image1 = ImagePicker();

  String parcelUrl = "";
  
  Future<void> updateOrderStatus(String orderUid) async {
  try {

    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFile =
        FirebaseStorage.instance.ref().child('parcels').child('users$imgId');
    UploadTask task = imageFile.putFile(_parcel!);
    TaskSnapshot snapshot = await task;
    parcelUrl = await snapshot.ref.getDownloadURL();
    // writing all values
    await FirebaseFirestore.instance.collection('orders').doc(orderUid).update({
      'parcelPhoto': parcelUrl,
      'parcelStatus': "Parcel Collected at Pickup Point"
    });
    print('Order status updated successfully');
  } on FirebaseException catch (e) {
    if (e.code == 'not-found') {
      print('Document does not exist');
    } else {
      print('Error updating order status: $e');
    }
  } catch (e) {
    print('Error updating order status: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: widget.name);
    TextEditingController mobNoController = TextEditingController(text: widget.mobNo);
    TextEditingController destiNameController = TextEditingController(text: widget.destiName);
    TextEditingController destiMobnoController = TextEditingController(text: widget.mobNo);
    TextEditingController priceController = TextEditingController(text: widget.price.toStringAsFixed(2));
    TextEditingController emailController = TextEditingController(text: widget.email);
    print(widget.price);
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
              BigText(title: "Order Id ${widget.orderId}"),
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
                height: 850,
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
                        title: "Enter Parcel Details",
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
                      control: nameController,
                        validate: (value){
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter Name"),
                    const SizedBox(
                      height: 20,
                    ),
                    Field_Widget(
                      valid: AutovalidateMode.always,
                      control: mobNoController,
                        validate: (value){
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter Mobile Number"),
                    const SizedBox(
                      height: 20,
                    ),
                    Field_Widget(
                      valid: AutovalidateMode.always,
                      control: destiNameController,
                        validate: (value){
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter Destination Person Name"),
                    const SizedBox(
                      height: 20,
                    ),
                    Field_Widget(
                      valid: AutovalidateMode.always,
                      control: destiMobnoController,
                        validate: (value){
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter Destination Person Mobile Number"),
                    const SizedBox(
                      height: 20,
                    ),
                    Field_Widget(
                      valid: AutovalidateMode.always,
                      control: emailController,
                        validate: (value){
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    Field_Widget(
                      valid: AutovalidateMode.always,
                      control: priceController,
                        validate: (value){
                            return null;
                        },
                        type: TextInputType.text,
                        icon: Icons.perm_identity_outlined,
                        label: "Enter Price"),
                    const SizedBox(
                      height: 20,
                    ),
                    Image_Box(
                        text: "Parcel Photo",
                        child_widget: _parcel == null
                            ? const Center(
                                child: Text("Parcel Photo Not Selected"),
                              )
                            : Image.file(_parcel!),
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
                          print(widget.orderUid);
                          if (_parcel != null) {
                            updateOrderStatus(widget.orderUid);
                            Fluttertoast.showToast(msg: "Details Submitted");
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> DestinationRoute(driverUid: widget.driverUid, d_lat: widget.d_lat, d_lng: widget.d_lng, p_lat: widget.p_lat, p_lng: widget.p_lng,)));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please upload Parcel Photo");
                          }
                          
                        },
                        width: 255,
                        text: "Submit")
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
            ],
          )
        ],
      ),
    );
  }

  void takePhoto3(ImageSource source) async {
    // ignore: deprecated_member_use
    final img = await image1.getImage(source: source);
    setState(() {
      _parcel = File(img!.path);
    });
    //pathPAN = _panCard!.path.toString();
  }
}