// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types, unused_import, unused_field, must_call_super, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:pickrunner/pages/bank_details.dart';
import 'package:pickrunner/pages/chat.dart';
import 'package:pickrunner/pages/downloading_dialog.dart';
import 'package:pickrunner/pages/driving_lisence.dart';
import 'package:pickrunner/pages/monthly_report.dart';
import 'package:pickrunner/pages/pan_card.dart';
import 'package:pickrunner/pages/reference.dart';
import 'package:pickrunner/pages/request_for_change.dart';

import '../wallet/bill.dart';
import 'logoutscreen.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? _uid;
  String _name = "";
  String _email = "";
  String? _number;
  String? _secnumber;
  String? _driverid;
  String _drivingLinsence = "";
  String _drivingLinsenceImg = "";
  String _pancardNumber = "";
  String _pancardImg = "";
  String _bankaccNo = "";
  String _bankifsc = "";
  String _bankbranchname = "";
  String? _profileImg;

  var total = "5800";
  int mainIndex = 1;
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[buildTop(), buildContent()],
      ),
    );
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
        _driverid = userData['driverId'];
        _number = userData['mobNo'];
        _secnumber = userData['secNo'];
        _email = userData['email'];

        _drivingLinsence = userData['lNo'];
        _drivingLinsenceImg = userData['lPhoto'];
        _pancardNumber = userData['panNo'];
        _pancardImg = userData['panPhoto'];

        _bankaccNo = userData['accNo'];
        _bankifsc = userData['ifscNo'];
        _bankbranchname = userData['branchName'];
        _profileImg = userData['picPhoto'];
      } else {
        // User data does not exist in Firestore
        print('User data not found.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Widget buildTop() {
    var topp = coverHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        BuildCoverImage(),
        BuildProfileImage(),
      ],
    );
  }

  Widget BuildCoverImage() => Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          child: Image.asset(
            "assets/21641d33-b658-4852-9184-29af1ccdf6c8.jpg",
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
      );

  // ignore: non_constant_identifier_names
  Widget BuildProfileImage() => Container(
        child: Column(
          children: [
            Container(
              child: CircleAvatar(
                radius: profileHeight / 2,
                backgroundColor: Colors.grey.shade800,
                // ignore: prefer_const_constructors
                backgroundImage: NetworkImage("$_profileImg"),
              ),
            ),
            Container(
                child: Text(
              _name,
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                fontSize: 24.0,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            )),
          ],
        ),
      );

  Widget buildContent() => Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildSocialIcon(" ID CARD ", 1),
                const SizedBox(width: 12),
                buildSocialIcon("SETTINGS", 2),
                const SizedBox(width: 12),
                buildSocialIcon("STATISTICS", 3),
                const SizedBox(width: 12),
                buildSocialIcon("REFER", 4),
                const SizedBox(width: 12),
              ],
            ),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 31, 30, 30),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                    child: Text(
                      "PICKRUN",
                      style: TextStyle(
                        fontSize: 19.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Delivery of Essentional Goods",
                    style: TextStyle(
                      fontSize: 19.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.62,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(
                    width: 0.5, color: Color.fromARGB(255, 255, 255, 255))),
            child: getWidget(),
          ),
        ],
      );

  Widget getWidget() {
    if (mainIndex == 1) {
      return Container(
          child: Column(
        children: [
          SizedBox(height: 5),
          TextFormField(
            minLines: 1,
            maxLines: 1, enabled: false,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText:
                  " \t Number & ID  \t\t\t   \t\t\t\t $_name  &  $_driverid",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 2),
          TextFormField(
            minLines: 1,
            maxLines: 1, enabled: false,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText:
                  " \t City                                                    \t\t\t       Mumbai",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 2),
          TextFormField(
            minLines: 1,
            maxLines: 1, enabled: false,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText:
                  "  Second Number      \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t    $_secnumber",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 2),
          TextFormField(
            minLines: 1,
            maxLines: 1, enabled: false,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText:
                  "  Pickrun Contact                                  8080263326",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 2),
          TextFormField(
            minLines: 1,
            maxLines: 1, enabled: false,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText:
                  "  Pickrun Email                         pickrun@gmail.com",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 2, 2, 2), width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 2),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DownloadingDialog()),
              );
            },
            child: const Text(
              "ID CARD 📥",
            ),
          ),
          Container(
            child: Center(
              child: Text(
                  "Print the ID card and always keep this with you. In case the Police stop you,show them these ID card. This ID card allow you to deliver food and medicine",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 55, 36, 224))),
            ),
          )
        ],
      ));
    }
    if (mainIndex == 2) {
      return Container(
        child: Column(
          children: [
            TextFormField(
              minLines: 1,
              maxLines: 1, enabled: false,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.call,
                  color: Color.fromARGB(255, 3, 14, 12),
                ),
                labelText:
                    "Phone Number           \t\t\t\t\t\t\t\t  \t  $_number",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 110, 107, 107), width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            Container(
                child: InkWell(
              child: TextFormField(
                minLines: 1,
                maxLines: 1,
                enabled: false, //on click add driving licence
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.directions_bike,
                    color: Color.fromARGB(255, 3, 14, 12),
                  ),
                  labelText: "Transport Type",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 110, 107, 107), width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => drivinglicence(
                          driving_No: _drivingLinsence,
                          drivinglicImg: _drivingLinsenceImg)),
                );
              },
            )),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const reference()),
                  );
                },
                child: TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  enabled: false, //on click change transport type
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 3, 14, 12),
                    ),
                    labelText: "References",
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 110, 107, 107),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                child: InkWell(
              child: TextFormField(
                minLines: 1,
                maxLines: 1,
                enabled: false, //on click change transport type
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.menu_book,
                    color: Color.fromARGB(255, 3, 14, 12),
                  ),
                  labelText: "PAN Card",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 110, 107, 107), width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          pancard(panNo: _pancardNumber, panImg: _pancardImg)),
                );
              },
            )),
            Container(
                child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => bankdetails(
                          AccNo: _bankaccNo,
                          ifsc: _bankifsc,
                          branch: _bankbranchname)),
                );
              },
              child: TextFormField(
                minLines: 1,
                maxLines: 1,
                enabled:
                    false, //on click change bank details with otp verification
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.menu_book,
                    color: Color.fromARGB(255, 3, 14, 12),
                  ),
                  labelText: "Bank Details",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 110, 107, 107), width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            )),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogoutScreen()),
                  );
                },
                child: TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  enabled: false, //om click open list of regions and update
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.logout_sharp,
                      color: Color.fromARGB(255, 3, 14, 12),
                    ),
                    labelText: "Logout                            ",
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 110, 107, 107),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            email: _email,
                            name: _name,
                          )),
                );
              },
              child: const Text(
                "Request for Change 📝",
              ),
            ),
          ],
        ),
      );
    }
    if (mainIndex == 3) {
      return Container(
        child: Column(
          children: [
            Container(
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Balance",
                      style: TextStyle(
                          fontSize: 18.5,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    const SizedBox(width: 12),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(250, 32, 226, 42)),
                      child: Text("   + 500   "),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)))),
                      child: Text("   History   ")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => bill()),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 254, 254, 254)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0))))),
                      child: Text("   Pay Us   ")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => bill()),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)))),
                      child: Text("   Withdraw   ")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "STATISTICS",
                style: TextStyle(
                  fontSize: 18.5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "100",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "COD    ",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "50",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      " NON-COD ",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "50",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Total                          ",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "               500",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "In Last 7 Days           ",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "             500",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "In Last 30 days           ",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "          500",
                      style: TextStyle(
                        fontSize: 18.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MonthlyReport()),
                );
              },
              child: const Text(
                "Check Monthly Report 📝",
              ),
            ),
          ],
        ),
      );
    }
    if (mainIndex == 4) {
      return Container(
        child: Image.asset("assets/refer.png"),
      );
    }
    return Container(
      child: Text("Dafault"),
    );
  }

  Widget buildSocialIcon(textt, int index) => Container(
        child: Material(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              onTap: () {
                mainIndex = index;
                setState(() {});
              },
              child: Text(
                textt,
                style: TextStyle(
                  fontSize: 17.5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      );
}
