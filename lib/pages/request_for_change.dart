// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types, body_might_complete_normally_nullable, avoid_print

import 'package:flutter/material.dart';

class requestforchange extends StatefulWidget {
  const requestforchange({Key? key}) : super(key: key);

  @override
  State<requestforchange> createState() => requestforchangeState();
}

class requestforchangeState extends State<requestforchange> {
  @override
  Widget build(BuildContext context) {
    TextEditingController did = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Request for Change"),
        backgroundColor: Color.fromARGB(98, 4, 0, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Enter Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                autovalidateMode: AutovalidateMode.always,
                minLines: 1,
                maxLines: 7,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    hintText: 'E.g change my bank details ',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Mandatory Field  *";
                  }
                },
                controller: controllerDescription,
              ),
            ),
            SizedBox(height: 20),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    print(controllerDescription.text);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
