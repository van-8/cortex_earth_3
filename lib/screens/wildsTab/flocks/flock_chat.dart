import 'package:flutter/material.dart';

class FlockChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Column(
        children: [
          Text('Moderator can set 2 modes: Casual and Formal.'),
          Text('\nCASUAL is chat style, no restrictions.'),
          Text(
              '\nFORMAL means users limited to 1 Correspondence per day, minimum word count requirement.'),
          Text('\nAllow polls'),
          Text(
              'Settings: notifications, limit # of messages allowed /person/day, etc.'),
        ],
      ),
    );
  }
}
