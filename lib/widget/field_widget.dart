import 'package:flutter/material.dart';

class Field_Widget extends StatelessWidget {
  final TextInputType type;
  final IconData icon;
  final String label;
  const Field_Widget(
      {Key? key, required this.type, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
        ),
      ),
    );
  }
}
