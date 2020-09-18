import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/widgets/actionbar_post.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:flutter/cupertino.dart';

class PostDetail extends StatelessWidget {
  // final String authorID, title, content;
  final PostModel post;

  const PostDetail({
    Key key,
    this.post,
    // this.authorID,
    // this.title,
    // this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: kPostTitle),
              SizedBox(height: 5),
              Text(
                post.authorID,
                style: kPostAuthor,
              ),
              Container(
                color: Colors.grey[300],
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 5.0),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Text(
                post.content,
                style: kPostContent,
              ))),
              Container(
                child: CupertinoTextField(),
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
              ActionBarPost(),
            ],
          ),
        ),
      ),
    );
  }
}
