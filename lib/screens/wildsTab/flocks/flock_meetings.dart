import 'package:flutter/material.dart';

class FlockMeetingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Sync with my calendar'),
          Text('List of upcoming meetings'),
          Text('Create a meeting'),
          Text('Archived Meetings'),
        ],
      ),
    );
  }
}
