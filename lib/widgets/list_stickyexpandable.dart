import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/material.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class ListviewStickyExpandable extends StatefulWidget {
  @override
  _ListviewStickyExpandableState createState() =>
      _ListviewStickyExpandableState();
}

class _ListviewStickyExpandableState extends State<ListviewStickyExpandable> {
  var sectionList = _MockData.getExampleSections(6, 4);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ExpandableListView(
        builder: SliverExpandableChildDelegate<String, ExampleSection>(
          sectionList: sectionList,
          itemBuilder: (context, sectionIndex, itemIndex, index) {
            String item = sectionList[sectionIndex].items[itemIndex];
            return ListTile(
              visualDensity: VisualDensity.compact,
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, gradient: kGradientGreenBlue),
                child: CircleAvatar(
                  radius: 15,
                  child: Text("$index"),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                ),
              ),
              title: Text(item),
              onTap: () {},
            );
          },
          sectionBuilder: (context, containerInfo) => _SectionWidget(
            section: sectionList[containerInfo.sectionIndex],
            containerInfo: containerInfo,
            onStateChanged: () {
              //notify ExpandableListView that expand state has changed.
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {});
                }
              });
            },
          ),
        ),
      ),
    ));
  }
}

class _SectionWidget extends StatefulWidget {
  final ExampleSection section;
  final ExpandableSectionContainerInfo containerInfo;
  final VoidCallback onStateChanged;

  _SectionWidget({this.section, this.containerInfo, this.onStateChanged});

  @override
  __SectionWidgetState createState() => __SectionWidgetState();
}

class __SectionWidgetState extends State<_SectionWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  AnimationController _controller;

  Animation _iconTurns;

  Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _iconTurns =
        _controller.drive(_halfTween.chain(CurveTween(curve: Curves.easeIn)));
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));

    if (widget.section.isSectionExpanded()) {
      _controller.value = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.containerInfo
      ..header = _buildHeader()
      ..content = _buildContent();
    return ExpandableSectionContainer(
      info: widget.containerInfo,
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
          gradient: kGradientGreenBlue,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(
          widget.section.header,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        trailing: RotationTransition(
          turns: _iconTurns,
          child: const Icon(
            Icons.expand_less,
            color: Colors.white70,
          ),
        ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    widget.section.setSectionExpanded(!widget.section.isSectionExpanded());
    if (widget.section.isSectionExpanded()) {
      if (mounted && widget.onStateChanged != null) {
        widget.onStateChanged();
      }
      _controller.forward().then((_) {});
    } else {
      _controller.reverse().then<void>((void value) {
        if (mounted && widget.onStateChanged != null) {
          widget.onStateChanged();
        }
      });
    }
  }

  Widget _buildContent() {
    return SizeTransition(
      sizeFactor: _heightFactor,
      child: widget.containerInfo.content,
    );
  }
}

class _MockData {
  ///return a example list, by default, we have 10 sections,
  ///each section has 5 items.
  static List<ExampleSection> getExampleSections(
      [sectionSize = 10, itemSize = 5]) {
    var sections = List<ExampleSection>();
    for (int i = 0; i < sectionSize; i++) {
      var section = ExampleSection()
        ..header = "Header #$i"
        ..items = List.generate(itemSize, (index) => "Cascade item $index")
        ..expanded = true;
      sections.add(section);
    }
    return sections;
  }
}

///Section model example
///
///Section model must implements ExpandableListSection<T>, each section has
///expand state, sublist. "T" is the model of each item in the sublist.
class ExampleSection implements ExpandableListSection<String> {
  //store expand state.
  bool expanded;
  //return item model list.
  List<String> items;

  //example header, optional
  String header;

  @override
  List<String> getItems() {
    return items;
  }

  @override
  bool isSectionExpanded() {
    return expanded;
  }

  @override
  void setSectionExpanded(bool expanded) {
    this.expanded = expanded;
  }
}
