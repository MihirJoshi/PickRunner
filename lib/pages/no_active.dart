import 'package:flutter/material.dart';

class NoActive extends StatefulWidget {
  const NoActive({Key? key}) : super(key: key);

  @override
  State<NoActive> createState() => _NoActive();
}

class _NoActive extends State<NoActive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'All orders are Completed..',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              "You can Accpet the order Now!!",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}