// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Field_Widget extends StatelessWidget {
  final TextInputType type;
  final TextEditingController control;
  final IconData icon;
  final String label;
  final String? Function(String?)? validate;
  AutovalidateMode valid;
  Field_Widget(
      {Key? key,
      required this.control,
      required this.type,
      required this.icon,
      required this.label,
      required this.validate,
      required this.valid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        controller: control,
        validator: validate,
        keyboardType: type,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
        ),
      ),
    );
  }
}
