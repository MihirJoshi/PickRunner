// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types, unnecessary_string_interpolations, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'dart:io';

class drivinglicence extends StatefulWidget {
  String driving_No, drivinglicImg;
  drivinglicence(
      {Key? key, required this.driving_No, required this.drivinglicImg})
      : super(key: key);

  @override
  State<drivinglicence> createState() => drivinglicenceState();
}

class drivinglicenceState extends State<drivinglicence> {
  @override
  Widget build(BuildContext context) {
    String driving_No = '${widget.driving_No}';
    String drivinglicImg = '${widget.drivinglicImg}';

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
                    labelText: "    Driving License Number : $driving_No",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Image.network(drivinglicImg),
            ),
          ],
        ),
      ),
    );
  }
}
