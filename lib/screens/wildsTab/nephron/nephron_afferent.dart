import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';

class NephronAfferentScreen extends StatefulWidget {
  @override
  _NephronAfferentScreenState createState() => _NephronAfferentScreenState();
}

class _NephronAfferentScreenState extends State<NephronAfferentScreen> {
  final Map<int, Widget> _sectionTitle = const <int, Widget>{
    0: Text('Initials'),
    1: Text('Invited'),
    2: Text('Requirements'),
  };

  final Map<int, Widget> _sections = const <int, Widget>{
    0: NephronAfferentInitial(),
    1: NephronAfferentInvited(),
    2: NephronAfferentReqs(),
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
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 12.0,
            ),
            child: _sections[_sectionValue],
          ),
        ],
      ),
    );
  }
}

class NephronAfferentInitial extends StatelessWidget {
  const NephronAfferentInitial({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Initial submissions'),
        Text('Identify the ones that are appropriate for in-depth peer review'),
      ],
    );
  }
}

class NephronAfferentInvited extends StatelessWidget {
  const NephronAfferentInvited({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Invited for in-depth peer review'),
        Text('Find reviewers for manuscripts'),
        Text(
            'request more detailed information about the work to support the peer review process, for example names of co-authors, details of major datasets, and ethics statements. Authors are asked to agree to publish their work under the terms of the Creative Commons Attribution license (PDF of the agreement), or the Creative Commons CC0 public domain dedication (PDF of the agreement) if one or more authors are US-government employees'),
      ],
    );
  }
}

class NephronAfferentReqs extends StatelessWidget {
  const NephronAfferentReqs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Set out basic requirements for submissions'),
        Text('Other stuff'),
      ],
    );
  }
}
