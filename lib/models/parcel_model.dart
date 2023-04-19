import 'package:firebase_auth/firebase_auth.dart';

class DriverModel {
  String? uid;
  String? name;
  String? mobNo;
  String? email;
  String? destiName;
  String? destiMobNo;
  String? orderId;
  String? driverUid;
  String? orderUid;
  String? parcelPhoto;
  String? price;

  DriverModel({
    this.uid,
    this.name,
    this.mobNo,
    this.email,
    this.destiName,
    this.destiMobNo,
    this.parcelPhoto,
    this.price,
    this.driverUid,
    this.orderId,
    this.orderUid,
  });

  // recieving data from the server

  factory DriverModel.fromMap(map) {
    return DriverModel(
      uid: map['uid'],
      name: map['name'],
      mobNo: map['mobNo'],
      email: map['email'],
      destiName: map['destiName'],
      destiMobNo: map['destiMobNo'],
      parcelPhoto: map['parcelPhoto'],
      orderId: map['orderId'],
      orderUid: map['orderUid'],
      driverUid: map['driverUid'],
      price: map['price'],
    );
  }

  //sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'mobNo': mobNo,
      'email': email,
      'destiName': destiName,
      'destiMobno':destiMobNo,
      'price':price,
      'parcelPhoto':parcelPhoto,
      'orderId': orderId,
      'driverUid': driverUid,
      'orderUid': orderUid,
    };
  }
}
