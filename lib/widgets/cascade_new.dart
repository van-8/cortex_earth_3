import 'package:flutter/material.dart';

class CascadeNewDialogue extends StatefulWidget {
  @override
  _CascadeNewDialogueState createState() => _CascadeNewDialogueState();
}

class _CascadeNewDialogueState extends State<CascadeNewDialogue> {
  bool isPrivate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Text('title of new cascade'),
          SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Text('Private'),
            value: isPrivate,
            contentPadding: EdgeInsets.symmetric(horizontal: 14),
            onChanged: (value) {
              setState(() {
                isPrivate = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
