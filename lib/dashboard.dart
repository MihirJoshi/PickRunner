// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'pages/active.dart';
import 'pages/available.dart';
import 'pages/completed.dart';
import 'pages/notification.dart';
import 'package:pickrunner/pages/profile_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String istapped = ' ';

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Available', 'Active', 'Completed'];
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Row(
                    
                    children: [
                      
                      Text(
                        "Orders",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(right: 55)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const profilepage()),
                            );
                          },
                          icon: const Icon(Icons.settings)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Notifications()),
                            );
                          },
                          icon: const Icon(Icons.chat)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const profilepage()),
                            );
                          },
                          icon: const Icon(Icons.face))
                    ],
                  ),
                  centerTitle: true,
                  backgroundColor: const Color.fromARGB(255, 228, 93, 100),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  pinned: true,
                  expandedHeight: 120.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: const TabBar(
                    indicatorColor: Color.fromARGB(255, 255, 255, 255),
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
              ),
            ];
          },
          body: TabBarView(
            children: [
              Available(),
              Active(driverUid: FirebaseAuth.instance.currentUser!.uid),
              Completed(),
            ],
          ),
        ),
      ),
    );
  }
}
