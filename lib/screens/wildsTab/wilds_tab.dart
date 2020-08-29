import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'feed_screen.dart';
import 'frolic_screen.dart';
import 'groups_screen.dart';
import 'journals.dart';

class WildsTab extends StatelessWidget {
  final List<String> _list = [
    'Feed',
    'Journals',
    'Groups',
    'Frolic',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _list.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text("Wilds", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Mdi.cogOutline,
                  color: Colors.grey[500],
                ),
                onPressed: null)
          ],
          bottom: PreferredSize(
            preferredSize: Size(400, 30),
            child: Container(
              child: TabBar(
                indicatorColor: Colors.brown[800],
                labelColor: Colors.brown[800],
                isScrollable: true,
                tabs: _list.map((String ss) {
                  return Tab(text: ss);
                }).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FeedScreen(),
            JournalsScreen(),
            GroupsScreen(),
            FrolicScreen(),
          ],
        ),
      ),
    );
  }
}
