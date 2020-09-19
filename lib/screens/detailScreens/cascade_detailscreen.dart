import 'package:cortex_earth_3/widgets/article_list.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'package:cortex_earth_3/constants.dart';

class CascadeDetailScreen extends StatefulWidget {
  final CascadeModel cascade;
  CascadeDetailScreen({Key key, @required this.cascade}) : super(key: key);

  @override
  _CascadeDetailScreenState createState() => _CascadeDetailScreenState();
}

class _CascadeDetailScreenState extends State<CascadeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        // color: Colors.amber,
        child: SafeArea(
            child: Column(
          children: [
            _buildTopBar(),
            _buildInfo(),
            _buildCascadeList(),
          ],
        )),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(widget.cascade.name, style: kProjectTitle)),
          ),
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
        child: Column(
      children: [
        Text(widget.cascade.description, style: kPostAuthor),
      ],
    ));
  }

  Widget _buildCascadeList() {
    return Expanded(
      child: ArticlesList(),
    );
  }
}
