import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/nephron.dart';
import 'package:mdi/mdi.dart';
import 'dart:math' as math;

import '../constants.dart';

class NephronTile extends StatelessWidget {
  final String uid;
  final NephronModel nephron;
  final Function onTap;
  final Function longPressCallback;

  const NephronTile({
    Key key,
    this.uid,
    this.nephron,
    this.onTap,
    this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int iconMdiCodepoint = int.parse(nephron.iconMdiCodepoint);
    return ListTile(
      title: Text(
        nephron.name,
        style: kListViewTitleStyle,
      ),
      leading: Icon(MdiIconData(iconMdiCodepoint)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(nephron.subscriberCount.toString()),
          Text('SUBSCRIBERS',
              style: TextStyle(fontSize: 7, color: Colors.grey)),
        ],
      ),
      onTap: onTap,
      onLongPress: longPressCallback,
    );
  }
}
