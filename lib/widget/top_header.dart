import 'package:flutter/material.dart';
import 'package:pickrunner/pages/active.dart';
import 'package:pickrunner/pages/available.dart';
import 'package:pickrunner/pages/completed.dart';

class Top_Header extends StatefulWidget {
  const Top_Header({Key? key}) : super(key: key);

  @override
  State<Top_Header> createState() => _Top_HeaderState();
}

class _Top_HeaderState extends State<Top_Header> {
  String istapped = ' ';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          bottom: TabBar(
            indicatorColor: Colors.redAccent,
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: 'Available',
              ),
              Tab(
                text: 'Active',
              ),
              Tab(
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(child: Available()),
            Container(child: Active()),
            Container(child: Completed()),
          ],
        ),
      ),
    );
  }
}
