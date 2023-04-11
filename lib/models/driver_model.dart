import 'package:firebase_auth/firebase_auth.dart';

class DriverModel {
  String? uid;
  String? name;
  String? address;
  String? email;
  String? mobNo;
  String? pinCode;
  String? picPhoto;
  String? adharNo;
  String? adharFrontPhoto;
  String? adharBackPhoto;
  String? panNo;
  String? panPhoto;
  String? lNo;
  String? lPhoto;
  String? accNo;
  String? ifscNo;
  String? branchName;
  String? accType;
  String? pass;
  String? rePass;
  String? type;
  String? driverId;

  DriverModel({
    this.uid,
    this.name,
    this.address,
    this.email,
    this.mobNo,
    this.pinCode,
    this.picPhoto,
    this.adharNo,
    this.adharFrontPhoto,
    this.adharBackPhoto,
    this.panNo,
    this.panPhoto,
    this.lNo,
    this.lPhoto,
    this.accNo,
    this.ifscNo,
    this.branchName,
    this.accType, 
    this.pass, 
    this.rePass,
    this.type,
     this.driverId,
  });

  // recieving data from the server

  factory DriverModel.fromMap(map) {
    return DriverModel(
      uid: map['uid'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      mobNo: map['mobNo'],
      pinCode: map['pinCode'],
      picPhoto: map['picPhoto'],
      adharNo: map['adharNo'],
      adharFrontPhoto: map['adharFrontPhoto'],
      adharBackPhoto: map['adharBackPhoto'],
      panNo: map['panNo'],
      panPhoto: map['panPhoto'],
      lNo: map['lNo'],
      lPhoto: map['lPhoto'],
      accNo: map['accNo'],
      ifscNo: map['ifscNo'],
      accType: map['accType'],
      pass: map['pass'],
      rePass: map['rePass'],
      type: map['type'],
      driverId: map['driverId'],
    );
  }

  //sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'address': address,
      'email': email,
      'mobNo': mobNo,
      'pinCode':pinCode,
      'picPhoto':picPhoto,
      'adharNo':adharNo,
      'adharFrontPhoto': adharFrontPhoto,
      'adharBackPhoto': adharBackPhoto,
      'panNo': panNo,
      'panPhoto': panPhoto,
      'lNo': lNo,
      'lPhoto': lPhoto,
      'accNo': accNo,
      'ifscNo':ifscNo,
      'branchName': branchName,
      'accType': accType,
      'pass': pass,
      'rePass': rePass,
      'type': type,
      'driverId': driverId,
    };
  }
}
