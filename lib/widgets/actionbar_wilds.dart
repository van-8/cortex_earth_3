import 'package:cortex_earth_3/widgets/marks.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../constants.dart';

class ActionBarWilds extends StatefulWidget {
  @override
  _ActionBarWildsState createState() => _ActionBarWildsState();
}

class _ActionBarWildsState extends State<ActionBarWilds> {
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
              showCupertinoModalBottomSheet(
                  expand: false,
                  barrierColor: barrierColor,
                  context: context,
                  builder: (context, scrollController) {
                    return MarksDetail();
                  });
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
                'Quality',
                '22 reviewers affirmed',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Row(
              children: [
                Icon(
                  Mdi.textBoxCheckOutline,
                  size: 16,
                  semanticLabel: 'Quality',
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
                'Polarity',
                '',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Row(
              children: [
                Icon(
                  Mdi.atomVariant,
                  size: 16,
                  semanticLabel: 'Polarity',
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
              icon: Icon(Mdi.share),
              tooltip: 'Share',
              onPressed: () {
                Get.snackbar(
                  'Share',
                  'native ShareSheet for iOS and Android',
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
                        'Planted in your Garden',
                        'Added Task to \'Read this article\' \nSaved to \'Unread\' Cascade',
                        snackPosition: SnackPosition.BOTTOM,
                      )
                    // ignore: unnecessary_statements
                    : null;
              }),
        ],
      ),
    );
  }
}
