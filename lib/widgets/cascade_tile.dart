import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'package:cortex_earth_3/constants.dart';

class CascadeTile extends StatelessWidget {
  final String uid;
  final CascadeModel cascade;
  final Function onTap;
  final Function longPressCallback;
  final Function checkboxCallback;

  const CascadeTile({
    Key key,
    this.uid,
    this.cascade,
    this.onTap,
    this.checkboxCallback,
    this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longPressCallback,
        onTap: onTap,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cascade.name),
            Text(
              '5',
              style: kSynapseTileSubtitle,
            ),
          ],
        ),
        trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
        // leading: Checkbox(
        //     value: cascade.,
        //     onChanged: (newValue) {
        //       Database().updateCascade(newValue, uid, cascade.cascadeID);
        //     }),
        );
  }
}
