import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

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
        Text('Admin stuff'),
        Text('Announcements'),
        Text('Editorial Board'),
        Text('Moderators'),
        Text('Security'),
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
    return Container(
      child: CustomScrollView(
        slivers: [
          _StickyHeaderList(index: 0),
          _StickyHeaderList(index: 1),
          _StickyHeaderList(index: 2),
          _StickyHeaderList(index: 3),
        ],
      ),
    );
  }
}

class _StickyHeaderList extends StatefulWidget {
  _StickyHeaderList({
    Key key,
    this.index,
    this.isDone,
  }) : super(key: key);

  final int index;
  final bool isDone;

  @override
  _StickyHeaderListState createState() => _StickyHeaderListState();
}

class _StickyHeaderListState extends State<_StickyHeaderList> {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: _TaskHeader(index: widget.index),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            visualDensity: VisualDensity.compact,
            leading: Checkbox(value: false, onChanged: null),
            title: Text(
              'Task $i',
              style: kListViewTitleStyle,
            ),
          ),
          childCount: 6,
        ),
      ),
    );
  }
}

class _TaskHeader extends StatelessWidget {
  const _TaskHeader({
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
          title ?? 'Working Group #${index + 1}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

/////

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
        Text('Rejection rate'),
        Text('avg time to peer review'),
        Text('interaction rate'),
      ],
    );
  }
}
