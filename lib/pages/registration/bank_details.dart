import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/password.dart';
import 'package:pickrunner/pages/registration/profile_pic.dart';

// ignore: camel_case_types
class Bank_Details extends StatefulWidget {
  const Bank_Details({Key? key}) : super(key: key);

  @override
  State<Bank_Details> createState() => _Bank_DetailsState();
}

// ignore: camel_case_types
class _Bank_DetailsState extends State<Bank_Details> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final next_button = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(187, 7, 207, 183),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 225,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Password_Details()));
        },
        child: const Text(
          "Next",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 223, 221),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Registration",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Steps: 6/7",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Bank Details",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text(
                      "- - - - - - - ->",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 22),
                    child: const Text("Password Details",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2.0, 2.0), color: Colors.green)
                        ]),
                    height: 7,
                    width: 98,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2.0, 2.0), color: Colors.grey)
                        ]),
                    height: 7,
                    width: 100,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                margin: const EdgeInsets.only(left: 1, right: 1),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2.0, 2.0),
                          color: Color.fromARGB(147, 250, 250, 250))
                    ]),
                height: 540,
                width: 500,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Enter Bank Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.account_balance_outlined),
                          labelText: 'Enter Account Number ',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.code_outlined),
                          labelText: 'Enter IFSC Code. ',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.near_me),
                          labelText: 'Enter Branch Name ',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.type_specimen_outlined),
                          labelText: 'Enter Account Type ',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      child: next_button,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
