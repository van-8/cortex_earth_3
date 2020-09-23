import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';

class NephronAcceptedScreen extends StatefulWidget {
  @override
  _NephronAcceptedScreenState createState() => _NephronAcceptedScreenState();
}

class _NephronAcceptedScreenState extends State<NephronAcceptedScreen> {
  final Map<int, Widget> _sectionTitle = const <int, Widget>{
    0: Text('Accepted'),
    1: Text('Featured'),
  };

  final Map<int, Widget> _sections = const <int, Widget>{
    0: NephronAccepted(),
    1: NephronFeatured(),
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

class NephronAccepted extends StatelessWidget {
  const NephronAccepted({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'Paper accepted, \nready to be affirmed (instead of published?) and released to the feed.'),
      ],
    );
  }
}

class NephronFeatured extends StatelessWidget {
  const NephronFeatured({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Papers the editors want to give special attention'),
        Text('Discuss special consideration'),
      ],
    );
  }
}
