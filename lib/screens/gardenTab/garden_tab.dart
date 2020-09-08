import 'package:flutter/material.dart';

import 'articles_listscreen.dart';
import 'books_listscreen.dart';
import 'data_listscreen.dart';
import 'methods_listscreen.dart';
import 'models_listscreen.dart';
import 'synapse_listscreen.dart';
import 'package:cortex_earth_3/constants.dart';

class GardenTab extends StatelessWidget {
  final List<String> _list = [
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
      length: _list.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Row(
            children: [
              Text("Garden", style: TextStyle(color: Colors.black)),
              Text('Search'),
            ],
          ),
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
                indicatorColor: kGardenTheme,
                isScrollable: true,
                labelColor: kGardenTheme,
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
