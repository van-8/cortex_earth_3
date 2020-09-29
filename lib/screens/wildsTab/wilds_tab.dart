import 'package:flutter/material.dart';

import '../../constants.dart';
import 'feed_screen.dart';
import 'frolic_screen.dart';
import 'flocks/flocks_screen.dart';
import 'nephron/nephron_screen.dart';

class WildsTab extends StatelessWidget {
  final List<String> _list = [
    'FEED',
    'NEPHRONS',
    'FLOCKS',
    'FROLIC',
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
          title: Text("Wilds", style: TextStyle(color: kWildsColor)),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: kIconActiveColor,
                ),
                onPressed: null)
          ],
          bottom: PreferredSize(
            preferredSize: Size(400, 30),
            child: Container(
              child: TabBar(
                indicatorColor: kWildsColor,
                labelColor: kWildsColor,
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
            NephronScreen(),
            FlocksScreen(),
            FrolicScreen(),
          ],
        ),
      ),
    );
  }
}
