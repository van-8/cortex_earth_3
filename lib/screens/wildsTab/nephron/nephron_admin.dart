import 'package:cortex_earth_3/screens/wildsTab/nephron/nephron_admin_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';
import 'nephron_admin_tasks.dart';
import 'nephron_admin_status.dart';

class NephronAdminScreen extends StatefulWidget {
  @override
  _NephronAdminScreenState createState() => _NephronAdminScreenState();
}

class _NephronAdminScreenState extends State<NephronAdminScreen> {
  final Map<int, Widget> _sectionTitle = const <int, Widget>{
    0: Text('Status'),
    1: Text('Tasks'),
    2: Text('Settings'),
  };

  final Map<int, Widget> _sections = <int, Widget>{
    0: NephronAdminStatus(),
    1: NephronAdminTasks(),
    2: NephronSettings(),
  };

  int _sectionValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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
