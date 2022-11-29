import 'package:flutter/material.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/small_text.dart';

class StepsHeader extends StatelessWidget {
  final String small_text;
  final double small_size;
  final FontWeight small_weight;
  const StepsHeader({
    Key? key,
    required this.small_text,
    required this.small_size,
    required this.small_weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          child: BigText(
            title: "Registration",
            size: 26,
            weight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 20),
          alignment: Alignment.topLeft,
          child: SmallText(
            title: small_text,
            weight: small_weight,
            size: small_size,
          ),
        ),
      ],
    );
  }
}
