import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/login_page.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Log()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 255, 255, 255)),
                  Color.fromARGB(255, 255, 255, 255)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Image.asset("assets/logo.png"),
          )
        ],
      ),
    );
  }
}
