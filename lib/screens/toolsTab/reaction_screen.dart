import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class ReactionTest extends StatefulWidget {
  @override
  _ReactionTestState createState() => _ReactionTestState();
}

class _ReactionTestState extends State<ReactionTest> {
  String text = 'Ready to click';
  Color screenColor = Colors.red;
  Stopwatch stopwatch;
  bool isRunning = false;
  final dur = const Duration(seconds: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ready,
      child: Container(
        alignment: Alignment.center,
        child: Text(text),
        color: screenColor,
      ),
    );
  }

  void ready() {
    isRunning
        ? setState(() {
            screenColor = Colors.blue;
            stopwatch.stop();
            text = stopwatch.elapsedMilliseconds.toString();
            //
          })
        : setState(() {
            screenColor = Colors.green;
            text = 'yep yep';
            stopwatch.start();
            isRunning = true;
          });
  }

  void starttimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (stopwatch.isRunning) {
      starttimer();
    }
    setState(() {
      text = stopwatch.elapsedMilliseconds.toString();
    });
  }
}
