// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';

class drivinglicence extends StatefulWidget {
  const drivinglicence({Key? key}) : super(key: key);

  @override
  State<drivinglicence> createState() => drivinglicenceState();
}

class drivinglicenceState extends State<drivinglicence> {
  @override
  Widget build(BuildContext context) {
    String DLnum = "4512789663M45";
    return Scaffold(
      appBar: AppBar(
        title: Text("Transport Type"),
        backgroundColor: Color.fromARGB(98, 4, 0, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "    Driving License Number : $DLnum",
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
