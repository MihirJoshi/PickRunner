// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class pancard extends StatefulWidget {
  String panNo, panImg;
  pancard({Key? key, required this.panNo, required this.panImg})
      : super(key: key);

  @override
  State<pancard> createState() => pancardState();
}

class pancardState extends State<pancard> {
  @override
  Widget build(BuildContext context) {
    String panNo = '${widget.panNo}';
    String panImg = '${widget.panImg}';

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
                    labelText: "  Pan Card Number : $panNo",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Image.network(panImg),
            ),
          ],
        ),
      ),
    );
  }
}
