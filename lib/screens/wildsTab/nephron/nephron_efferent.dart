import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';

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

class NephronEfferentReviewing extends StatelessWidget {
  const NephronEfferentReviewing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Manuscript in hands of Reviewers',
          style: kSynapseTileSubtitle,
        ),
        ListTile(
            title: Text(
                'Finite scale of spatial representation in the hippocampus'),
            subtitle: Text('Kjelstrup, K.B. et al.'),
            trailing: Text('3w', style: kNephronTileEfferentDays)),
        ListTile(
            title: Text(
                'Phase precession and phase-locking of hippocampal pyrmadial cells'),
            subtitle: Text('Jones, M.W. and Wilson, M.A.'),
            trailing: Text('5w', style: kNephronTileEfferentDaysOverdue)),
      ],
    );
  }
}

class NephronEfferentRevising extends StatelessWidget {
  const NephronEfferentRevising({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Manuscripts in hands of author', style: kSynapseTileSubtitle),
        ListTile(
            title: Text('Organization of cell assemblies in the hippocampus'),
            subtitle: Text('Harris, K.D. et al.'),
            trailing: Text('2w', style: kNephronTileEfferentDays)),
        ListTile(
            title: Text(
                'Multi-plexed oscillations and phase-rate coding in the basal brain'),
            subtitle: Text('Tingley, D. et al'),
            trailing: Text('6w', style: kNephronTileEfferentDaysOverdue)),
      ],
    );
  }
}

class NephronEfferentDecision extends StatelessWidget {
  const NephronEfferentDecision({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Manuscript in hand of editors'),
        Text('Editor assess for decision'),
        Text('Other stuff'),
      ],
    );
  }
}
