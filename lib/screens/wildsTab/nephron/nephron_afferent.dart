import 'package:cortex_earth_3/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:mdi/mdi.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class NephronAfferentScreen extends StatefulWidget {
  @override
  _NephronAfferentScreenState createState() => _NephronAfferentScreenState();
}

class _NephronAfferentScreenState extends State<NephronAfferentScreen> {
  final Map<int, Widget> _sectionTitle = const <int, Widget>{
    0: Text('Initials'),
    1: Text('Invited'),
    2: Text('Settings'),
  };

  final Map<int, Widget> _sections = <int, Widget>{
    0: NephronAfferentInitial(),
    1: NephronAfferentInvited(),
    2: NephronAfferentReqs(),
  };

  int _sectionValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: Container(
                child: _sections[_sectionValue],
              ),
            ),
          ],
        ),
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
        Text('Identify manuscripts appropriate for in-depth peer review.',
            style: kSynapseTileSubtitle),
        ListTile(
          title: Text('Manuscript 1'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: Icon(
                    Mdi.arrowLeftBoldHexagonOutline,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Get.snackbar('Reject Manuscript',
                        'Input a message, template provided, confirm');
                  }),
              SizedBox(width: 30),
              Icon(
                Mdi.arrowRightBoldBoxOutline,
                color: Colors.lightGreen,
              ),
            ],
          ),
          onTap: () {},
        ),
        ListTile(
            title: Text(
                'Finite scale of spatial representation in the hippocampus'),
            subtitle: Text('Kjelstrup, K.B. et al.'),
            trailing: Text('1w', style: kNephronTileEfferentDays)),
        ListTile(
            title: Text(
                'Phase precession and phase-locking of hippocampal pyrmadial cells'),
            subtitle: Text('Jones, M.W. and Wilson, M.A.'),
            trailing: Text('3w', style: kNephronTileEfferentDaysOverdue)),
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
    return Container(
      // color: Colors.amber,
      height: 608,
      child: Expanded(
        child:
            // Text(
            //     'Invited for peer review. Find suitable reviewers. Request detailed info: names of co-authors, details of major datasets, and ethics statements, etc. set in Requirements.',
            //     style: kSynapseTileSubtitle),
            CustomScrollView(
          slivers: [
            _InvitedStickyHeaderList(index: 0),
            _InvitedStickyHeaderList(index: 1),
            _InvitedStickyHeaderList(index: 2),
            _InvitedStickyHeaderList(index: 3),
          ],
        ),
      ),
    );
  }
}

class _InvitedStickyHeaderList extends StatefulWidget {
  _InvitedStickyHeaderList({
    Key key,
    this.index,
    this.isDone,
  }) : super(key: key);

  final int index;
  final bool isDone;

  @override
  _InvitedStickyHeaderListState createState() =>
      _InvitedStickyHeaderListState();
}

class _InvitedStickyHeaderListState extends State<_InvitedStickyHeaderList> {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: AfferentInvitedHeader(index: widget.index),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            visualDensity: VisualDensity.compact,
            leading: Checkbox(value: false, onChanged: null),
            title: Text(
              'Manuscript ${i + 1}',
              style: kListViewTitleStyle,
            ),
          ),
          childCount: 6,
        ),
      ),
    );
  }
}

class AfferentInvitedHeader extends StatelessWidget {
  const AfferentInvitedHeader({
    Key key,
    this.index,
    this.title,
    this.color = Colors.brown,
  }) : super(key: key);

  final String title;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        height: 30,
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          title ?? 'Keyword ${index + 1}:   Recomended reviewer names',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

////
class NephronAfferentReqs extends StatelessWidget {
  const NephronAfferentReqs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Initials', style: kBold),
        SettingsTile(title: 'Basic Requirements'),
        SettingsTile(title: 'Templates'),
        SizedBox(height: 40),
        Text('Invited', style: kBold),
        SettingsTile(title: 'Additional Requirements'),
        SettingsTile(title: 'Templates'),
        SettingsTile(title: 'Soft-Assign Reviewers by keyword'),
      ],
    );
  }
}
