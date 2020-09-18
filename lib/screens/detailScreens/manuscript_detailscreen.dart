import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:cortex_earth_3/constants.dart';

class ManuscriptDetailScreen extends StatefulWidget {
  @override
  _ManuscriptDetailScreenState createState() => _ManuscriptDetailScreenState();
}

class _ManuscriptDetailScreenState extends State<ManuscriptDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 14),
        child: Column(
          children: [
            Text('STATUS'),
            _buildStatus(),
            Text('Recent comments'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus() {
    BoxConstraints timeLineBoxConstraints = BoxConstraints(minWidth: 150);
    return Container(
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Container(
                    child: Text('Received', style: kManuscriptTimeline),
                    constraints: timeLineBoxConstraints)),
            TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Container(
                    child: Text('Invited for Peer Review',
                        style: kManuscriptTimeline),
                    constraints: timeLineBoxConstraints)),
            TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Container(
                    child: Text('Identifying Reviewers',
                        style: kManuscriptTimeline),
                    constraints: timeLineBoxConstraints)),
            TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Container(
                    child: Text('Reviewers Found', style: kManuscriptTimeline),
                    constraints: timeLineBoxConstraints)),
            TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Container(
                    child: Text('In Review', style: kManuscriptTimeline),
                    constraints: timeLineBoxConstraints)),
            TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Container(
                    child: Text('Awaiting Response from Authors',
                        style: kManuscriptTimeline),
                    constraints: timeLineBoxConstraints)),
          ],
        ),
      ),
    );
  }
}
