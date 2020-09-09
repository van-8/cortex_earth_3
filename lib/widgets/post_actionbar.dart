import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class PostActionBar extends StatefulWidget {
  @override
  _PostActionBarState createState() => _PostActionBarState();
}

class _PostActionBarState extends State<PostActionBar> {
  int appropriateTest;
  int detailed;
  int original;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.snackbar(
                'Appropriate Test of Hypothesis',
                '17 peers',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Row(
              children: [
                Icon(
                  Mdi.testTube,
                  size: 16,
                  semanticLabel: 'Appropriate Test of Hypothesis',
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
              icon: isSaved ? Icon(Mdi.bookmark) : Icon(Mdi.bookmarkOutline),
              tooltip: 'Save',
              onPressed: () {
                setState(() {
                  isSaved = !isSaved;
                });
                isSaved
                    ? Get.snackbar(
                        'Saved to \'Unread\' Cascade',
                        'Task to \'Read this article\' added',
                        snackPosition: SnackPosition.BOTTOM,
                      )
                    // ignore: unnecessary_statements
                    : null;
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
