import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';
import 'nephron_afferent_invited.dart';
import 'nephron_afferent_initial.dart';

class NephronAfferentScreen extends StatefulWidget {
  @override
  _NephronAfferentScreenState createState() => _NephronAfferentScreenState();
}

class _NephronAfferentScreenState extends State<NephronAfferentScreen> {
  final Map<int, Widget> _sectionTitle = const <int, Widget>{
    0: Text('Initials'),
    1: Text('Invited'),
  };

  final Map<int, Widget> _sections = <int, Widget>{
    0: NephronAfferentInitial(),
    1: NephronAfferentInvited(),
  };

  int _sectionValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                padding: const const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                child: Container(
                  child: _sections[_sectionValue],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
