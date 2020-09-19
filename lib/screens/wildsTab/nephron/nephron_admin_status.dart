import 'package:flutter/material.dart';

class NephronAdminStatus extends StatelessWidget {
  const NephronAdminStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Announcements'),
        Text('Upcoming Events'),
        SizedBox(height: 40),
        Text('Statistics'),
        Text('People viewing'),
        Text('Interactions'),
        Text('Rejection Rate'),
        Text('Avg time to Peer Review'),
        Text('Avg time to Affirmation'),
      ],
    );
  }
}
