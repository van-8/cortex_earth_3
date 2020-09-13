import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';

class NephronAdminScreen extends StatefulWidget {
  @override
  _NephronAdminScreenState createState() => _NephronAdminScreenState();
}

class _NephronAdminScreenState extends State<NephronAdminScreen> {
  final Map<int, Widget> _sectionTitle = const <int, Widget>{
    0: Text('Admin'),
    1: Text('Tasks'),
    2: Text('Stats'),
  };

  final Map<int, Widget> _sections = const <int, Widget>{
    0: NephronAdminAdmin(),
    1: NephronAdminTasks(),
    2: NephronAdminStats(),
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

class NephronAdminAdmin extends StatelessWidget {
  const NephronAdminAdmin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Admins stuff'),
        Text('Other stuff'),
      ],
    );
  }
}

class NephronAdminTasks extends StatelessWidget {
  const NephronAdminTasks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Task Listview builder'),
        Text('Other stuff'),
      ],
    );
  }
}

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
      ],
    );
  }
}
