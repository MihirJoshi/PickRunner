import 'package:flutter/material.dart';

class Offpage extends StatefulWidget {
  const Offpage({Key? key}) : super(key: key);

  @override
  State<Offpage> createState() => _Offpage();
}

class _Offpage extends State<Offpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You are not working',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              "You were away, so we've hidden available orders and turned off notifications",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
