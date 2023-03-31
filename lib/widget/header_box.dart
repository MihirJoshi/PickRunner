import 'package:flutter/material.dart';
import 'package:pickrunner/widget/big_text.dart';

// ignore: camel_case_types
class Header_Box extends StatelessWidget {
  final Color color;
  // ignore: non_constant_identifier_names
  final String pre_text;
  // ignore: non_constant_identifier_names
  final String next_dash;
  // ignore: non_constant_identifier_names
  final String next_text;
  // ignore: non_constant_identifier_names
  final Color next_color;
  const Header_Box(
      {Key? key,
      this.color = Colors.grey,
      required this.pre_text,
      this.next_color = Colors.grey,
      required this.next_dash,
      required this.next_text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: BigText(
                  title: pre_text,
                  size: 15,
                  weight: FontWeight.bold,
                  color: Colors.green,
                )),
            Container(
                padding: const EdgeInsets.only(right: 10),
                child: BigText(
                  title: next_dash,
                  size: 15,
                  weight: FontWeight.bold,
                  color: Colors.green,
                )),
            Container(
                padding: const EdgeInsets.only(right: 22),
                child: BigText(
                  title: next_text,
                  size: 15,
                  weight: FontWeight.bold,
                  color: next_color,
                )),
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
                    BoxShadow(offset: Offset(2.0, 2.0), color: Colors.green)
                  ]),
              height: 7,
              width: 98,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(offset: const Offset(2.0, 2.0), color: color)
                  ]),
              height: 7,
              width: 100,
            ),
          ],
        ),
      ],
    );
  }
}
