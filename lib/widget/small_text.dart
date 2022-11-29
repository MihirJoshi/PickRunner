import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  const SmallText(
      {Key? key, required this.title, required this.size, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: size, fontWeight: weight),
    );
  }
}
