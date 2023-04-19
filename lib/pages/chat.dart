// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pickrunner/dashboard.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: const Text("Chat Page"),
          )
        ],
      ),
    );
  }
}
