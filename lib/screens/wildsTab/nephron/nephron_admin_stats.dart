import 'package:flutter/material.dart';

class NephronAdminStats extends StatelessWidget {
  const NephronAdminStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Admins Trends'),
        Text('people viewing, interactions'),
        Text('Rejection rate'),
        Text('avg time to peer review'),
        Text('interaction rate'),
      ],
    );
  }
}
