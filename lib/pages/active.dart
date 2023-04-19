// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pickrunner/models/order_model.dart';
import 'package:pickrunner/pages/direction.dart';
import 'package:pickrunner/widget/button_widget.dart';

class Active extends StatefulWidget {
  String driverUid;
  Active({Key? key, required this.driverUid}) : super(key: key);

  @override
  State<Active> createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  OrderModel? _activeOrder;
  String? _currentAddress;
  Position? _currentPosition;

  @override
void initState() {
  super.initState();
  _fetchActiveOrder(widget.driverUid);
  _getCurrentPosition();
}

void _fetchActiveOrder(String currentDriverId) {
  FirebaseFirestore.instance
      .collection('orders')
      .where('status', isEqualTo: 'Active')
      .where('driverUid', isEqualTo: currentDriverId)
      .get()
      .then((QuerySnapshot snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data();
      final order = OrderModel.fromMap(data);
      setState(() {
        _activeOrder = order;
      });
    }
  });
}
Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    appBar: AppBar(
      title: Text('Active Order'),
    ),
    body: Center(
      child: _activeOrder == null
          ? CircularProgressIndicator()
          :  Column(
        children: [
          SizedBox(height: 80,),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "Order ID: ${_activeOrder?.orderId}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20, right: 10, left: 10)),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 5)),
              const Icon(
                Icons.currency_rupee_outlined,
                color: Colors.black,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  _activeOrder!.price!.toStringAsFixed(0),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 28),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "From: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      alignment: Alignment.topRight,
                      child: Text(
                        "${_activeOrder?.picAddress}",
                        maxLines: 3,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 28),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "To: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      alignment: Alignment.topRight,
                      child: Text(
                        "${_activeOrder?.destiAddress}",
                        maxLines: 3,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 55),
            child:  Text(
              "Weight: ${_activeOrder!.weight.toString()} KG" " " " " " " "Type: ${_activeOrder!.category}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          Button_Widget(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Direction(driverUid: widget.driverUid, c_lat: _currentPosition!.latitude, c_lng: _currentPosition!.longitude, p_lat: _activeOrder!.picLat!, p_lng: _activeOrder!.picLng!,)));
          }, width: 270, text: "Direction"),
        ],
      ),
    ),
    );
  }
}
