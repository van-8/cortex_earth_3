import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class ActionBar extends StatelessWidget {
  int appropriateTest;
  int detailed;
  int original;

  ActionBar({
    this.appropriateTest,
    this.detailed,
    this.original,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(
            Mdi.textBoxCheckOutline,
            size: 16,
            semanticLabel: 'Detailed',
          ),
          Text(
            ' 22   ',
            style: TextStyle(fontSize: 12),
          ),
          Icon(
            Icons.blur_circular,
            size: 16,
            semanticLabel: 'Original',
          ),
          Text(
            ' 45   ',
            style: TextStyle(fontSize: 12),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'More...',
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.playlist_add),
              tooltip: 'Add to Cascade',
              onPressed: () {}),
          IconButton(icon: Icon(Mdi.share), tooltip: 'Share', onPressed: () {}),
        ],
      ),
    );
  }
}
