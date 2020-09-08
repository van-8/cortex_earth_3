import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../constants.dart';
import 'feed_screen.dart';
import 'frolic_screen.dart';
import 'flocks_screen.dart';
import 'nephron_screen.dart';

class WildsTab extends StatelessWidget {
  final List<String> _list = [
    'Feed',
    'Nephrons',
    'Flocks',
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
                  Icons.more_horiz,
                  color: kIconActiveColor,
                ),
                onPressed: null)
          ],
          bottom: PreferredSize(
            preferredSize: Size(400, 30),
            child: Container(
              child: TabBar(
                indicatorColor: kWildsTheme,
                labelColor: kWildsTheme,
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
