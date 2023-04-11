import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/dashboard.dart';
import 'package:pickrunner/pages/registration/profile_pic.dart';
import 'package:pickrunner/pages/registration/personal.dart';
import 'package:pickrunner/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
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
      home: const Dashboard(),
    );
  }
}
