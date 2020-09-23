import 'package:cortex_earth_3/widgets/task_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../constants.dart';

class ProjectTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        child: CustomScrollView(
          slivers: [
            _StickyHeaderList(index: 0),
            _StickyHeaderList(index: 1),
            _StickyHeaderList(index: 2),
            _StickyHeaderList(index: 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: kGradientGreenBlue),
          child: Icon(Icons.add),
        ),
        onPressed: () {
          showCupertinoModalBottomSheet(
              expand: false,
              barrierColor: barrierColor,
              context: context,
              builder: (context, scrollController) => Material(
                    child: TaskAddScreen(),
                  ));
        },
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
      header: Header(index: widget.index),
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

class Header extends StatelessWidget {
  const Header({
    Key key,
    this.index,
    this.title,
    this.color = Colors.lightBlue,
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          title ?? 'Collaborator #$index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
