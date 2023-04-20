import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  final Color color;
  const BigText(
      {Key? key,
      required this.title,
      this.size = 20,
      this.weight = FontWeight.bold,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}
