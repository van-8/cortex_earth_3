import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'cascades_listscreen.dart';
import 'inbox_screen.dart';
import 'lab_manager.dart';
import 'project_listscreen.dart';
import 'questions_listscreen.dart';
import 'todo_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> _list = [
    'Todos',
    'Inbox',
    'Projects',
    'Cascades',
    'Questions',
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
                indicatorColor: Colors.blue[800],
                labelColor: Colors.blue[800],
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
            TodoScreen(),
            InboxScreen(),
            ProjectsListScreen(),
            CascadesListScreen(),
            QuestionsListScreen(),
            LabManager(),
          ],
        ),
      ),
    );
  }
}
