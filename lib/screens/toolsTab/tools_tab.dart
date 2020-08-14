import 'package:flutter/material.dart';

import 'tricorder_screen.dart';
import 'voiceAssist_screen.dart';

class ToolsScreen extends StatelessWidget {
  final List<String> _list = [
    'VoiceAssist',
    'TriCorder',
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
                  Icons.settings,
                  color: Colors.black,
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
            VoiceAssistScreen(),
            TricorderScreen(),
          ],
        ),
      ),
    );
  }
}
