import 'package:flutter/material.dart';
import 'package:pickrunner/pages/registration/profile_pic.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/field_widget.dart';
import 'package:pickrunner/widget/header_box.dart';
import 'package:pickrunner/widget/header_steps.dart';

// ignore: camel_case_types
class Personal_Details extends StatefulWidget {
  const Personal_Details({Key? key}) : super(key: key);

  @override
  State<Personal_Details> createState() => _Personal_DetailsState();
}

// ignore: camel_case_types
class _Personal_DetailsState extends State<Personal_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 223, 221),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              const StepsHeader(
                  small_text: "Steps: 1/7",
                  small_size: 18,
                  small_weight: FontWeight.w500),
              const SizedBox(
                height: 20,
              ),
              const Header_Box(
                color: Colors.grey,
                pre_text: "Personal Details",
                next_dash: "- - - - - - - >",
                next_text: "Profile Picture",
                next_color: Colors.grey,
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
                      child: BigText(
                        title: "Enter Personal Details",
                        size: 20,
                        color: Colors.black,
                        weight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Field_Widget(
                        type: TextInputType.text,
                        icon: Icons.person,
                        label: "Enter Name"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Field_Widget(
                        type: TextInputType.phone,
                        icon: Icons.phone,
                        label: "Enter Mobile No."),
                    const SizedBox(
                      height: 15,
                    ),
                    const Field_Widget(
                        type: TextInputType.emailAddress,
                        icon: Icons.email_outlined,
                        label: "Enter Email"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Field_Widget(
                        type: TextInputType.multiline,
                        icon: Icons.location_on,
                        label: "Enter Address"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Field_Widget(
                        type: TextInputType.number,
                        icon: Icons.code_outlined,
                        label: "Enter PinCode"),
                    const SizedBox(
                      height: 28,
                    ),
                    Button_Widget(
                      pressed: () {
                        print("Mihir");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile_Pic()));
                      },
                      text: "Next",
                      width: 225,
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
