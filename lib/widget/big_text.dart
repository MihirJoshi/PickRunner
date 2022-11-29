import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  final Color color;
  BigText(
      {Key? key,
      required this.title,
      required this.size,
      required this.weight,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}
