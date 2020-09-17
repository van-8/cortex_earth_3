import 'package:flutter/material.dart';

class ManuscriptDetailScreen extends StatefulWidget {
  @override
  _ManuscriptDetailScreenState createState() => _ManuscriptDetailScreenState();
}

class _ManuscriptDetailScreenState extends State<ManuscriptDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 14),
        child: Column(
          children: [
            Text('Timeline of Peer Review Status'),
            Text('Recent comments'),
          ],
        ),
      ),
    );
  }
}
