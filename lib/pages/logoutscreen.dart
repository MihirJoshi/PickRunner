// ignore_for_file: avoid_print
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickrunner/pages/login_page.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _signOut(context); // Call sign out function on button press
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }

  // Function to handle sign out
  void _signOut(BuildContext context) async {
    const storage = FlutterSecureStorage();
    try {
      await FirebaseAuth.instance.signOut();
      await storage.delete(key: "uid"); // Call Firebase signOut() method
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Log()),
          (Route<dynamic> route) =>
              false); // Navigate to login screen and remove all previous routes
    } catch (e) {
      print('Error signing out: $e');
      // Handle sign out error, if any
    }
  }
}
