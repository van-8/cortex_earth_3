import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:cortex_earth_3/data/filter_data.dart';

class FilterBar extends StatefulWidget {
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: DirectSelect(
                itemExtent: 40.0,
                selectedIndex: selectedIndexType,
                backgroundColor: Colors.white54,
                child: MySelectionItem(
                  isForList: false,
                  title: type[selectedIndexType],
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndexType = index;
                  });
                },
                items: buildType(),
              ),
            ),
            Container(
              child: DirectSelect(
                itemExtent: 40.0,
                selectedIndex: selectedIndexSort,
                backgroundColor: Colors.white54,
                child: MySelectionItem(
                  isForList: false,
                  title: sort[selectedIndexSort],
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndexSort = index;
                  });
                },
                items: buildSort(),
              ),
            ),
            Container(
              child: DirectSelect(
                itemExtent: 40.0,
                selectedIndex: selectedIndexDate,
                backgroundColor: Colors.white54,
                child: MySelectionItem(
                  isForList: false,
                  title: date[selectedIndexDate],
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndexDate = index;
                  });
                },
                items: buildDate(),
              ),
            ),
            SizedBox(
              height: 150.0,
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> buildSort() {
  return sort
      .map((val) => MySelectionItem(
            title: val,
          ))
      .toList();
}

List<Widget> buildType() {
  return type
      .map((val) => MySelectionItem(
            title: val,
          ))
      .toList();
}

List<Widget> buildDate() {
  return date
      .map((val) => MySelectionItem(
            title: val,
          ))
      .toList();
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.grey,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
