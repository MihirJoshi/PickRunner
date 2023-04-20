import 'package:flutter/material.dart';

// ignore: camel_case_types
class Circle_Avatar extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final ImageProvider<Object>? image_provide;
  final Function()? tap;
  const Circle_Avatar(
      // ignore: non_constant_identifier_names
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.image_provide,
      required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 0.5, color: Colors.white),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  //blurRadius: 20,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: image_provide,
                  ),
                ),
                Positioned(
                  child: InkWell(
                    onTap: tap,
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.teal,
                      size: 28.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
