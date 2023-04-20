// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/circle_avatar.dart.dart';

class StepsHeader extends StatelessWidget {
  final String small_text;
  final double small_size;
  final FontWeight small_weight;
  final Color color;
  const StepsHeader({
    Key? key,
    required this.small_text,
    this.small_size = 18,
    this.small_weight = FontWeight.w500,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          child: const BigText(
            title: "Registration",
            size: 26,
            weight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.topLeft,
          child: BigText(
            title: small_text,
            weight: small_weight,
            size: small_size,
            color: color,
          ),
        ),
      ],
    );
  }
}
