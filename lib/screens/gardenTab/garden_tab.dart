import 'package:flutter/material.dart';

import 'articles_listscreen.dart';
import 'books_listscreen.dart';
import 'evidence_listscreen.dart';
import 'methods_listscreen.dart';
import 'models_listscreen.dart';
import 'synapse_listscreen.dart';

class GardenScreen extends StatelessWidget {
  final List<String> _list = [
    'Synapses',
    'Articles',
    'Books',
    'Evidence',
    'Models',
    'Methods',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _list.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Garden", style: TextStyle(color: Colors.black)),
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
                indicatorColor: Colors.lightGreen,
                isScrollable: true,
                labelColor: Colors.green,
                tabs: _list.map((String ss) {
                  return Tab(text: ss);
                }).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SynapsesListScreen(),
            ArticlesListScreen(),
            BooksListScreen(),
            EvidenceListScreen(),
            ModelsListScreen(),
            MethodsListScreen(),
          ],
        ),
      ),
    );
  }
}
