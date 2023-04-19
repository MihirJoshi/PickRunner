import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('status', isEqualTo: 'Available')
        .limit(5)
        .get();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: orders.map((order) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrderDetailScreen(
                              order: order,
                              uid: order.uid,
                              onOrderConfirmed: () => removeOrder(order.uid!),
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Order ID: ${order.orderId}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 20, right: 10, left: 10)),
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
                          child: Text(
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
                          child: Text(
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
