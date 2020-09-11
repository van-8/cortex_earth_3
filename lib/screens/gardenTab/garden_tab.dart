import 'package:flutter/material.dart';

import 'articles_listscreen.dart';
import 'books_listscreen.dart';
import 'data_listscreen.dart';
import 'methods_listscreen.dart';
import 'models_listscreen.dart';
import 'synapse_listscreen.dart';
import 'package:cortex_earth_3/constants.dart';

class GardenTab extends StatelessWidget {
  final List<String> _tabs = [
    'Synapses',
    'Data',
    'Articles',
    'Books',
    'Models',
    'Methods',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text("Garden", style: TextStyle(color: kGardenColor)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_horiz, color: kIconActiveColor),
                onPressed: null)
          ],
          bottom: PreferredSize(
            preferredSize: Size(400, 30),
            child: Container(
              child: TabBar(
                indicatorColor: kGardenColor,
                isScrollable: true,
                labelColor: kGardenColor,
                tabs: _tabs.map((String ss) {
                  return Tab(text: ss);
                }).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SynapsesListScreen(),
            DataListScreen(),
            ArticlesListScreen(),
            BooksListScreen(),
            ModelsListScreen(),
            MethodsListScreen(),
          ],
        ),
      ),
    );
  }
}
