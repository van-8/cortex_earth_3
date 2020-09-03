import 'package:flutter/material.dart';
// import 'package:cortex_earth_3/models/todo.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:mdi/mdi.dart';
import 'package:cortex_earth_3/constants.dart';

class SynapseableTile extends StatelessWidget {
  final String uid;
  // final Function onTap;
  final Function checkboxCallback;
  bool isSelected;
  final String text;

  SynapseableTile({
    Key key,
    this.uid,
    this.text,
    // this.onTap,
    this.checkboxCallback,
    this.isSelected = false,
  }) : super(key: key);

  _selected() {
    isSelected = !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: _selected(),
        title: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.grey : Colors.black87),
        ),
        leading: isSelected ? Icon(Mdi.circleOutline) : Icon(Mdi.circle));
  }
}
