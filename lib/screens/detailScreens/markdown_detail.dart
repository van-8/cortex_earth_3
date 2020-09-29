import 'package:cortex_earth_3/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;
import 'package:markdown_widget/markdown_widget.dart';
// import 'package:markdown_widget/markdown_toc.dart';

class MarkdownDetailScreen extends StatefulWidget {
  final ProjectModel project;

  MarkdownDetailScreen({Key key, this.project}) : super(key: key);

  @override
  _MarkdownDetailScreenState createState() => _MarkdownDetailScreenState();
}

class _MarkdownDetailScreenState extends State<MarkdownDetailScreen> {
  // final TocController _tocController = TocController();
  String text = 'nothing else is here';
  bool isPreview = true;

  @override
  void initState() {
    text = widget.project.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(child: isPreview ? buildPreview() : buildEditText()),
      Container(
        alignment: Alignment.bottomCenter,
        child: OutlineButton(
            child: isPreview ? Text('EDIT') : Text('PREVIEW'),
            onPressed: () {
              setState(() {
                isPreview = !isPreview;
              });
            }),
      ),
    ]);
  }

  Widget buildEditText() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      //   border: Border.all(
      //     color: Colors.green,
      //     // width: 3,
      //   ),
      // ),
      child: TextFormField(
        autofocus: true,
        expands: true,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        initialValue: text,
        onChanged: (text) {
          this.text = text;
          refresh();
        },
        style: TextStyle(textBaseline: TextBaseline.alphabetic),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            hintText: 'Input Here...',
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  Widget buildPreview() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: MarkdownWidget(
        data: text,
        // controller: _tocController,
      ),
    );
  }

  // Widget _buildActionBar() {
  //   return Container(
  //     child: Row(
  //       children: [IconButton(icon: Icon(Icons.save), onPressed: () {})],
  //     ),
  //   );
  // }
}
