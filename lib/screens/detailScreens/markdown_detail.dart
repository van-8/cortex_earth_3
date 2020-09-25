import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;
import 'package:markdown_widget/markdown_widget.dart';
import 'package:markdown_widget/markdown_toc.dart';

class MarkdownDetailScreen extends StatefulWidget {
  final String initialData;

  const MarkdownDetailScreen({Key key, this.initialData = ''})
      : super(key: key);

  @override
  _MarkdownDetailScreenState createState() => _MarkdownDetailScreenState();
}

class _MarkdownDetailScreenState extends State<MarkdownDetailScreen> {
  final TocController _tocController = TocController();
  String text = '';

  @override
  void initState() {
    text = _markdownData;
    super.initState();
  }

  final List<String> _tabs = ['Edit', 'Preview', 'ToC'];

  @override
  Widget build(BuildContext context) {
    return Material(
        child: DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(200, 90),
          child: Column(
            children: [
              Expanded(child: Text('Title')),
              TabBar(
                tabs: _tabs.map((e) => Tab(text: e)).toList(),
                indicatorColor: Colors.lightBlue,
                labelColor: Colors.lightBlue,
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildEditText(),
            _buildPreview(),
            _buildToCView(),
          ],
        ),
      ),
    ));
  }

  Widget _buildToCView() {
    return Row(
      children: [
        Expanded(child: _buildTOC()),
        Expanded(child: _buildPreview(), flex: 1)
      ],
    );
  }

  Widget _buildTOC() {
    return Container(
      child: TocListWidget(controller: _tocController),
    );
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

  Widget _buildPreview() {
    return MarkdownWidget(
      data: text,
      controller: _tocController,
    );
  }

  String _markdownData = """
# Markdown Test

This is a simple Markdown test. Provide a text string with Markdown tags to the Markdown widget and it will display the formatted output in a scrollable widget.

## Section 1
Maecenas eget **arcu egestas**, mollis ex vitae, posuere magna. Nunc eget
aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis eget est condimentum, vitae porttitor diam ornare.

## Section 2
Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend accumsan ante.__** Sed a fermentum elit. Curabitur sodales metus id mi ornare, in ullamcorper magna congue.

## Section 3
Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend accumsan ante.__** Sed a fermentum elit. Curabitur sodales metus id mi ornare, in ullamcorper magna congue.

## Section 4
Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend accumsan ante.__** Sed a fermentum elit. Curabitur sodales metus id mi ornare, in ullamcorper magna congue.

""";
}
