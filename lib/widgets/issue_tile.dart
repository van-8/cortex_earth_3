import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/issue.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:mdi/mdi.dart';

class IssueTile extends StatelessWidget {
  final String uid;
  final IssueModel issue;
  final Function onTap;
  final Function longPressCallback;
  final Function checkboxCallback;

  const IssueTile({
    Key key,
    this.uid,
    this.issue,
    this.onTap,
    this.checkboxCallback,
    this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          visualDensity: VisualDensity.compact,
          onLongPress: longPressCallback,
          onTap: onTap,
          title: Text(issue.title, style: kListViewTitleStyle),
          leading: issue.isClosed
              ? Icon(Mdi.alertCircleCheckOutline, color: Colors.red)
              : Icon(Mdi.alertCircleOutline, color: Colors.green),
          trailing: GestureDetector(
            onDoubleTap: () => Database().addUpvoteToIssue(uid, issue.issueID),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Mdi.thumbUpOutline, size: 14),
                  SizedBox(width: 5),
                  Text(issue.upvoteCount.toString()),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[200],
          margin: const EdgeInsets.fromLTRB(56, 0, 0, 0),
        ),
      ],
    );
  }
}
