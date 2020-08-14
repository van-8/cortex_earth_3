import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Text(
          'Imports emails from a work email address, which can be transformed into Todos, etc. Necessary feature, as most work in 2020 is communicated through email, and so this stream must be sunk into the app or it becomes useless.'),
    );
  }
}
