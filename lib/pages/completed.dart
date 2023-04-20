// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/models/order_model.dart';
import 'package:pickrunner/widget/button_widget.dart';

class Completed extends StatefulWidget {
  String driverUid;
  Completed({Key? key, this.driverUid = ""}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  OrderModel? _completeOrder;
  @override
  void initState() {
    super.initState();
    _fetchActiveOrder(widget.driverUid);
  }

  void _fetchActiveOrder(String currentDriverId) {
    FirebaseFirestore.instance
        .collection('orders')
        .where('status', isEqualTo: 'Completed')
        .where('driverUid', isEqualTo: currentDriverId)
        .get()
        .then((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        final order = OrderModel.fromMap(data);
        setState(() {
          _completeOrder = order;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Order'),
      ),
      body: Center(
        child: _completeOrder == null
            ? CircularProgressIndicator()
            : Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Order ID: ${_completeOrder?.orderId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, right: 10, left: 10)),
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
                          _completeOrder!.price!.toStringAsFixed(0),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                "${_completeOrder?.picAddress}",
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                "${_completeOrder?.destiAddress}",
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
                    child: Text(
                      "Weight: ${_completeOrder!.weight.toString()} KG"
                      " "
                      " "
                      " "
                      "Type: ${_completeOrder!.category}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                ],
              ),
      ),
    );
  }
}
