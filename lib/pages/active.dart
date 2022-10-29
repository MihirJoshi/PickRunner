import 'package:flutter/material.dart';

class Active extends StatefulWidget {
  const Active({Key? key}) : super(key: key);

  @override
  State<Active> createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("My new Active Page"),
        ),
      ),
    );
  }
}
