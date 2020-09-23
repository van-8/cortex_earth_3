import 'package:cortex_earth_3/models/synapse.dart';
import 'package:flutter/material.dart';

class SynapseDetailScreen extends StatelessWidget {
  final SynapseModel synapse;
  final EdgeInsets _textpadding = const EdgeInsets.fromLTRB(0, 0, 0, 10);
  final TextStyle _lineNumberStyle = TextStyle(fontWeight: FontWeight.bold);
  final TextStyle _titleStyle = TextStyle(fontSize: 12);

  SynapseDetailScreen({Key key, this.synapse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Text(synapse.content), padding: _textpadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      synapse.sourceDOI,
                      style: _titleStyle,
                    ),
                    padding: _textpadding,
                  ),
                ),
                Container(
                    child: Text(
                      synapse.lineNumber.toString(),
                      style: _lineNumberStyle,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0)),
              ],
            ),
            Container(child: Text('Date Created'), padding: _textpadding),
            Container(child: Text('Cacades'), padding: _textpadding),
            Container(child: Text('Projects'), padding: _textpadding),
          ],
        ),
      )),
    );
  }
}
