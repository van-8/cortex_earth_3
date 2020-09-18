import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ActionBarPost extends StatefulWidget {
  @override
  _ActionBarPostState createState() => _ActionBarPostState();
}

class _ActionBarPostState extends State<ActionBarPost> {
  int appropriateTest;
  int detailed;
  int original;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: isSaved
                  ? Icon(Mdi.exclamationThick, color: Colors.red)
                  : Icon(Mdi.exclamation, color: kIconActiveColor),
              tooltip: 'Prioritize',
              onPressed: () {
                setState(() {
                  isSaved = !isSaved;
                });
                isSaved
                    ? Get.snackbar(
                        'Prioritize this Thread',
                        'Keep it pinned to top',
                        snackPosition: SnackPosition.BOTTOM,
                      )
                    // ignore: unnecessary_statements
                    : null;
              }),
          IconButton(
              icon: Icon(Mdi.checkboxMarkedOutline, color: kIconActiveColor),
              tooltip: 'Add Task',
              onPressed: () {
                Get.snackbar(
                    'Add task', 'Create task with link to this conversation',
                    snackPosition: SnackPosition.BOTTOM);
              }),
          IconButton(
              icon: Icon(Mdi.archiveOutline, color: kIconActiveColor),
              tooltip: 'Archive',
              onPressed: () {
                Get.snackbar('Archive', 'Archive this conversation',
                    snackPosition: SnackPosition.BOTTOM);
              }),
          Spacer(),
          IconButton(
              icon: Icon(Icons.link, color: kIconActiveColor),
              tooltip: 'Add Link',
              onPressed: () {
                Get.snackbar('Add Link',
                    'Share link to synapse, article, data, project, cascade, nephron, anything',
                    snackPosition: SnackPosition.BOTTOM);
              }),
          IconButton(
              icon: Icon(Mdi.accountMultiplePlus, color: kIconActiveColor),
              tooltip: 'Add person to Conversation',
              onPressed: () {
                Get.snackbar(
                  'Add person to Conversation',
                  'Replace idea of static email with dynamic chat',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
          IconButton(
              icon: Icon(Icons.more_horiz, color: kIconActiveColor),
              tooltip: 'More...',
              onPressed: () {
                Get.snackbar(
                  'More',
                  'dropdown list of more actions',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
        ],
      ),
    );
  }
}
