import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/login_page.dart';
import 'dashboard.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final storage = const FlutterSecureStorage();
  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pickrunner',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: checkLoginStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == false) {
              return const Log();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          gradient: LinearGradient(
                              colors: [
                                (Color.fromARGB(255, 255, 255, 255)),
                                Color.fromARGB(255, 255, 255, 255)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Center(
                      child: Image.asset("assets/logo.png"),
                    )
                  ],
                ),
              );
            }
            return const Dashboard();
          }),
    );
  }
}
