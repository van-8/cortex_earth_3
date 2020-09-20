import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';

import 'nephron_efferent_decision.dart';
import 'nephron_efferent_revision.dart';
import 'nephron_efferent_review.dart';

class NephronEfferentScreen extends StatefulWidget {
  @override
  _NephronEfferentScreenState createState() => _NephronEfferentScreenState();
}

class _NephronEfferentScreenState extends State<NephronEfferentScreen> {
  final Map<int, Widget> _sectionTitle = const <int, Widget>{
    0: Text('In Review'),
    1: Text('In Revision'),
    2: Text('Decision'),
  };

  final Map<int, Widget> _sections = const <int, Widget>{
    0: NephronEfferentReviewing(),
    1: NephronEfferentRevising(),
    2: NephronEfferentDecision(),
  };

  int _sectionValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
          ),
          SizedBox(
            width: Get.width,
            child: CupertinoSegmentedControl<int>(
              children: _sectionTitle,
              borderColor: kNephronColor,
              unselectedColor: kNephronUnselectedColor,
              pressedColor: kNephronPressedColor,
              selectedColor: kNephronColor,
              onValueChanged: (int val) {
                setState(() {
                  _sectionValue = val;
                });
              },
              groupValue: _sectionValue,
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.amber,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              child: _sections[_sectionValue],
            ),
          ),
        ],
      ),
    );
  }
}
