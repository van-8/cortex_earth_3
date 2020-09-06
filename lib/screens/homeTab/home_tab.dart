import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'cascades_listscreen.dart';
import 'inbox_screen.dart';
import 'lab_manager.dart';
import 'project_listscreen.dart';
import 'task_screen.dart';

class HomeTab extends StatelessWidget {
  final List<String> _list = [
    'Tasks',
    'Inbox',
    'Projects',
    'Cascades',
    'Lab',
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
          title: Text("Home", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Mdi.cogOutline,
                  color: Colors.grey,
                ),
                onPressed: null)
          ],
          bottom: PreferredSize(
            preferredSize: Size(400, 30),
            child: Container(
              child: TabBar(
                indicatorColor: Colors.lightBlue,
                labelColor: Colors.lightBlue,
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
            TaskScreen(),
            InboxScreen(),
            ProjectListScreen(),
            CascadesListScreen(),
            LabManager(),
          ],
        ),
      ),
    );
  }
}
