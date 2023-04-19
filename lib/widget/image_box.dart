import 'package:flutter/material.dart';
import 'package:pickrunner/widget/big_text.dart';

// ignore: camel_case_types, must_be_immutable
class Image_Box extends StatelessWidget {
  final String text;
  double size;
  FontWeight weight;
  Color color;
  // ignore: non_constant_identifier_names
  final Widget child_widget;
  final Function()? pressed;
  Image_Box(
      {Key? key,
      required this.text,
      this.size = 16,
      this.color = Colors.grey,
      this.weight = FontWeight.w600,
      // ignore: non_constant_identifier_names
      required this.child_widget,
      required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              text,
              style:
                  TextStyle(fontSize: size, fontWeight: weight, color: color),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green),
          ),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: child_widget,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: pressed,
                    child: const BigText(
                      title: "Select Image",
                      size: 15,
                      weight: FontWeight.w500,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
