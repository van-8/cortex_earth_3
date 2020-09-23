import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/post.dart';

class PostTile extends StatelessWidget {
  final String uid;
  final PostModel post;
  final Function onTap;
  final Function longPressCallback;
  final Function onTapMore;

  const PostTile({
    Key key,
    this.uid,
    this.post,
    this.onTap,
    this.longPressCallback,
    this.onTapMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title),
            SizedBox(width: 10),
            Text(
              post.authorID,
              style: kSynapseTileSubtitle,
            ),
          ],
        ),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.grey[200]))),
      ),
    );
  }
}
