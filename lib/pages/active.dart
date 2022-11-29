// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Active extends StatefulWidget {
  const Active({Key? key}) : super(key: key);

  @override
  State<Active> createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.green,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(top: 150, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Thursday,',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '7 july',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "Order ID: 556945",
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
                  "299",
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
                        "Plot No. C-32, Darave Rd, Seawood Fountain, Nerul East, Navi Mumbai, Maharastra",
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
                        "Plot No. C-32, Darave Rd, Seawood Fountain, Nerul East, Navi Mumbai, Maharastra",
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
            child: const Text(
              "Weight: 5 KG" " " " " " " "Type: Food",
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
    );
  }
}
