import 'package:flutter/material.dart';
import 'package:pickrunner/dashboard.dart';
import 'package:pickrunner/pages/registration/profile_pic.dart';
import 'package:pickrunner/pages/registration/personal.dart';
import 'package:pickrunner/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pickrunner',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: const Personal_Details(),
    );
  }
}
