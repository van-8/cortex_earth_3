import 'package:cortex_earth_3/constants.dart';
import 'package:cortex_earth_3/screens/toolsTab/experiment.dart';
import 'package:cortex_earth_3/screens/toolsTab/flowmark.dart';
import 'package:cortex_earth_3/screens/toolsTab/reaction_screen.dart';
import 'package:cortex_earth_3/screens/toolsTab/sketch.dart';
import 'package:flutter/material.dart';

import 'ocr.dart';
import 'voiceAssist_screen.dart';

class ToolsTab extends StatelessWidget {
  final List<String> _list = [
    'VoiceAssist',
    'FlowMark',
    'OCR',
    'Experiment',
    'ReactionTime',
    'Sketch',
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
          title: Text("Tricorder", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: kIconActiveColor,
                ),
                onPressed: null)
          ],
          bottom: PreferredSize(
            preferredSize: Size(400, 30),
            child: Container(
              child: TabBar(
                indicatorColor: Colors.brown[800],
                labelColor: Colors.brown[800],
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
            VoiceAssistScreen(),
            FlowMarkScreen(),
            OCRScreen(),
            ExperimentScreen(),
            ReactionTest(),
            SketchScreen(),
          ],
        ),
      ),
    );
  }
}
