import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ActionBar extends StatefulWidget {
  @override
  _ActionBarState createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  int appropriateTest;
  int detailed;
  int original;
  bool hasTasks = false;
  bool isEndorsed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.snackbar(
                'Endorsed',
                'by 17 people you follow',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Row(
              children: [
                Icon(
                  Mdi.starFourPoints,
                  size: 16,
                  semanticLabel: 'Endorsed',
                ),
                Text(
                  ' 17   ',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.snackbar(
                'Detailed',
                '22 peers agreed',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Row(
              children: [
                Icon(
                  Mdi.textBoxCheckOutline,
                  size: 16,
                  semanticLabel: 'Detailed',
                ),
                Text(
                  ' 22   ',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.snackbar(
                'Original',
                '45 peers agreed',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.blur_circular,
                  size: 16,
                  semanticLabel: 'Original',
                ),
                Text(
                  ' 45   ',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'More...',
              onPressed: () {
                Get.snackbar(
                  'More',
                  'dropdown list of more actions',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
          IconButton(
              icon: isEndorsed
                  ? Icon(
                      Mdi.starFourPoints,
                      color: Colors.amber,
                    )
                  : Icon(Mdi.starFourPointsOutline, color: Colors.grey),
              tooltip: 'Endorse',
              onPressed: () {
                setState(() {
                  isEndorsed = !isEndorsed;
                });
                isEndorsed
                    ? Get.snackbar(
                        'Endorsed',
                        'You endorse this item, improving its discoverability by people who follow you',
                        snackPosition: SnackPosition.BOTTOM,
                      )
                    : Get.snackbar(
                        'Endorsement withdrawn',
                        '',
                        snackPosition: SnackPosition.BOTTOM,
                      );
              }),
          IconButton(
              icon: hasTasks
                  ? Icon(
                      Mdi.checkboxMultipleMarkedOutline,
                      color: Colors.blue,
                    )
                  : Icon(Mdi.checkboxMarkedOutline, color: Colors.grey),
              tooltip: 'Tasks',
              onPressed: () {
                setState(() {
                  hasTasks = !hasTasks;
                });
                hasTasks
                    ? Get.snackbar(
                        'List Tasks linked to this item',
                        'Mini popup. add task if none.',
                        snackPosition: SnackPosition.BOTTOM,
                      )
                    : Get.snackbar(
                        'No Tasks linked to this item, add a task',
                        'Mini popup',
                        snackPosition: SnackPosition.BOTTOM,
                      );
              }),
          IconButton(
              icon: Icon(Mdi.share),
              tooltip: 'Share',
              onPressed: () {
                Get.snackbar(
                  'Share',
                  'native ShareSheet for iOS and Android',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
        ],
      ),
    );
  }
}
