import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:mdi/mdi.dart';

class SearchTab extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Items $index");
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Mdi.magnify,
                color: kIconActiveColor,
              ),
              onPressed: () {
                showSearch(context: context, delegate: Search(widget.list));
              }),
          title: Text('Search'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: kIconActiveColor,
                ),
                onPressed: () {
                  Get.snackbar('Settings', 'Display order, auto listen');
                })
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    widget.list[index],
                  ),
                )));
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
