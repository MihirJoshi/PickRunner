// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';

class reference extends StatefulWidget {
  const reference({Key? key}) : super(key: key);

  @override
  State<reference> createState() => referenceState();
}

class referenceState extends State<reference> {
  @override
  Widget build(BuildContext context) {
    String refNum = "0";
    String refearn = "000";
    return Scaffold(
      appBar: AppBar(
        title: Text("Reference Details"),
        backgroundColor: Color.fromARGB(98, 4, 0, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: " No. of Referrals  : $refNum",
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: TextFormField(
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration(
                  labelText: "  Referral Earining : $refearn",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
