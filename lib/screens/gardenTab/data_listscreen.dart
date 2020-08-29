import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';

class DataListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: TagList()),
        Expanded(
          flex: 3,
          child: Container(),
        ),
      ],
    );
  }
}
