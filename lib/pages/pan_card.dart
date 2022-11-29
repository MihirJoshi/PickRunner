// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';

class pancard extends StatefulWidget {
  const pancard({Key? key}) : super(key: key);

  @override
  State<pancard> createState() => pancardState();
}

class pancardState extends State<pancard> {
  @override
  Widget build(BuildContext context) {
    String PCNum = "AHYPW2048M";
    return Scaffold(
      appBar: AppBar(
        title: Text("Pan Details"),
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
                    labelText: "  Pan Card Number : $PCNum",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Image.asset("assets/pan.png"),
            ),
          ],
        ),
      ),
    );
  }
}
