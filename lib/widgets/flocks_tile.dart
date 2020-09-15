import 'package:cortex_earth_3/models/flock.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class FlocksTile extends StatelessWidget {
  final String uid;
  final FlockModel flock;
  final Function onTap;
  final Function longPressCallback;

  const FlocksTile({
    Key key,
    this.uid,
    this.flock,
    this.onTap,
    this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int iconMdiCodepoint = int.parse(flock.iconMdiCodepoint);
    return ListTile(
      title: Text(
        flock.name,
        style: kListViewTitleStyle,
      ),
      leading: Icon(MdiIconData(iconMdiCodepoint)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(flock.memberCount.toString()),
          Text(flock.nickname,
              style: TextStyle(fontSize: 9, color: Colors.grey)),
        ],
      ),
      onTap: onTap,
      onLongPress: longPressCallback,
    );
  }
}
