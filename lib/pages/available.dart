import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/models/order_model.dart';
import 'package:pickrunner/pages/order_details_screen.dart';

class Available extends StatefulWidget {
  const Available({Key? key}) : super(key: key);

  @override
  State<Available> createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
  List<OrderModel> orders = [];
  String? driverUid;
  String? driverName;
  String? driverMobile;
  String? status;
  String? assignOrder;
  
  @override
  void initState() {
    super.initState();
    checkAssignedOrder();
    fetchOrders();
  }

  Future<void> checkAssignedOrder() async {
    final user = FirebaseAuth.instance.currentUser;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('driverUid', isEqualTo: user?.uid)
        .where('status', isEqualTo: 'Active')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final data = querySnapshot.docs.first.data();
      driverUid = data['driverUid'];
      driverName = data['driverName'];
      driverMobile = data['driverMobno'];
      assignOrder = data['orderId'];
      status = data['status'];
    }
  }
  
  Future<void> fetchOrders() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('orders').where('status', isEqualTo: 'available').limit(5).get();

    final List<OrderModel> fetchedOrders = [];
    

    querySnapshot.docs.forEach((doc) {
      final data = doc.data();
      final order = OrderModel.fromMap(data);
      fetchedOrders.add(order);
    });

    setState(() {
      orders = fetchedOrders;
    });
  }

  void removeOrder(String uid) {
  setState(() {
    orders.removeWhere((order) => order.uid == uid);
  });
}
bool canTakeOrder(OrderModel order) {
  if (driverUid != null && driverName != null && driverMobile != null) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Already Assigned'),
          content: Text(
              'You have already assigned to Order ${assignOrder}.\n\n Please Complete your pending order!!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    return false;
  } else {
    
    return true;
  }
}

  @override
  Widget build(BuildContext context) {
    print(driverUid);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: orders.map((order) {
              return Card(
                child: InkWell(
                  onTap: () {
                    if (canTakeOrder(order)) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OrderDetailScreen(
                            order: order,
                            uid: order.uid,
                            onOrderConfirmed: () => removeOrder(order.uid!),
                          ),
                        ),
                      );
                    }
                  
                  },
                  child: Padding
                  (
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Order ID: ${order.orderId}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                    order.price!.toStringAsFixed(0),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 28),
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
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
                        margin: const EdgeInsets.only(left: 40),
                        alignment: Alignment.topRight,
                        child: Text(
                          order.picAddress!,
                          maxLines: 3,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 28),
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
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
                          order.destiAddress!,
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
              padding: const EdgeInsets.only(left: 55),
              child:  Text(
                "Weight: ${order.weight} KG",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              ),
              const SizedBox(
              height: 12,
              ),
              Container(
              padding: const EdgeInsets.only(left: 55),
              child:  Text(
                "Type: ${order.category}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              ),
              const SizedBox(
              height: 5,
              ),
              
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
