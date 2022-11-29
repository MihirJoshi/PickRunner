// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:pickrunner/pages/bank_details.dart';
import 'package:pickrunner/pages/downloading_dialog.dart';
import 'package:pickrunner/pages/driving_lisence.dart';
import 'package:pickrunner/pages/monthly_report.dart';
import 'package:pickrunner/pages/pan_card.dart';
import 'package:pickrunner/pages/reference.dart';
import 'package:pickrunner/pages/request_for_change.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  var myname = "Rahul Waghmare";
  var total = "5800";
  int mainIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[buildTop(), buildContent()],
      ),
    );
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
        color: Colors.grey,
        child: Container(
          child: Image.network(
            "https://images.unsplash.com/photo-1633613286991-611fe299c4be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
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
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1608176906358-808c28865e2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"),
              ),
            ),
            Container(
                child: Text(
              myname,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
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
              labelText: "  Number & ID                8080263326 & M-2023001",
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
                  "  City                                                                Mumbai",
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
                  "  Second Number                                  8855886688",
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
                labelText: "Phone Number                         8080263326",
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
                      builder: (context) => const drivinglicence()),
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
                  MaterialPageRoute(builder: (context) => const pancard()),
                );
              },
            )),
            Container(
                child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const bankdetails()),
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
            TextFormField(
              minLines: 1,
              maxLines: 1,
              enabled: false, //om click open list of regions and update
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 3, 14, 12),
                ),
                labelText: "Change Region                 Mumbai",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 110, 107, 107), width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const requestforchange()),
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
                      child: Text("   Hostory   ")),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)))),
                      child: Text("   Pay Us   ")),
                  ElevatedButton(
                      onPressed: () {},
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
                      " COD ",
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
              height: 10,
            ),
            // ignore: sized_box_for_whitespace
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/rating.png",
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "My Income",
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
                      "Total                       ",
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
                      "              500",
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
