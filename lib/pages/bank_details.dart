// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, unused_import, camel_case_types, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bankdetails extends StatefulWidget {
  String AccNo, ifsc, branch;
  bankdetails({
    Key? key,
    required this.AccNo,
    required this.ifsc,
    required this.branch,
  }) : super(key: key);

  @override
  State<bankdetails> createState() => bankdetailsState();
}

class bankdetailsState extends State<bankdetails> {
  @override
  Widget build(BuildContext context) {
    String AccNo = '${widget.AccNo}';
    String ifsc = '${widget.ifsc}';
    String branch = '${widget.branch}';
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Details"),
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
                    labelText: "  Bank IFSC : $ifsc",
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
                  labelText: "  Bank Branch Name : $branch",
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: TextFormField(
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration(
                  labelText: "  Bank Account No : $AccNo",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
