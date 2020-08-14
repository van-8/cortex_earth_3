import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          'List of articles from subscribed journals, like Reddit. Options to sort by All, Specific Journal, Specific tags.'),
    );
  }
}
