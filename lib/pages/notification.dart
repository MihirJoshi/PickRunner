// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:pickrunner/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<Notifications> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? _uid;
  String _name = "";
  String _email = "";
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    try {
      DocumentSnapshot userSnapshot =
          await firestore.collection('drivers').doc(_uid).get();
      if (userSnapshot.exists) {
        // User data exists in Firestore
        Map<String, dynamic> userData = userSnapshot.data()
            as Map<String, dynamic>; // Cast to Map<String, dynamic>
        // Extract the desired fields from the user data
        _name = userData['name'];
        _email = userData['email'];
      } else {
        // User data does not exist in Firestore
        print('User data not found.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  String istapped = ' ';
  @override
  Widget build(BuildContext context) {
    String orderID = "#1000";
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 228, 93, 100),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 255, 255, 255),
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: 'Notification',
              ),
              Tab(
                text: 'Chat',
              ),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(0, 0, 10, 120),
          child: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(
                      "This is an notification about the order no.\n \t \t \t \t $orderID which is near to you",
                      style: TextStyle(
                          fontSize: 18.5, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is an notification about the order no.\n \t \t \t \t $orderID  which is near to you",
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is an notification about the order no.\n \t \t \t \t $orderID  which is near to you",
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is an notification about the order no.\n \t \t \t \t $orderID which is near to you",
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is an notification about the order no.\n \t \t \t \t $orderID  which is near to you",
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is an notification about the order no.\n \t \t \t \t #32323 which is near to you",
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is an notification about the order no.\n \t \t \t \t #32323 which is near to you",
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(name: _name, email: _email)),
                    );
                  },
                  child:
                      Text('Start Chat', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
