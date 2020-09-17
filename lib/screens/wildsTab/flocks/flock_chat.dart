import 'package:flutter/material.dart';

class FlockChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Chat App here. allow polls'),
          Text(
              'Settings: notifications, limit # of messages allowed /person/day, etc.'),
        ],
      ),
    );
  }
}
