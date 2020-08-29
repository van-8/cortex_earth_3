import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/tag.dart';

class TagTile extends StatelessWidget {
  final String uid;
  final TagModel tag;
  final Function onTap;

  const TagTile({
    Key key,
    this.uid,
    this.tag,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        tag.name,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
