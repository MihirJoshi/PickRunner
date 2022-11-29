import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Button_Widget extends StatelessWidget {
  final Function()? pressed;
  final double width;
  final String text;
  const Button_Widget({
    Key? key,
    required this.pressed,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(187, 7, 207, 183),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: width,
        onPressed: pressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
