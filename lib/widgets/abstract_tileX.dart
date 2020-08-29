import 'package:cortex_earth_3/widgets/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/article.dart';

class AbstractTileX extends StatelessWidget {
  final String uid;
  final ArticleModel articleAbstract;
  final Function onTap;

  const AbstractTileX({
    Key key,
    this.uid,
    this.articleAbstract,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              articleAbstract.title,
              style: TextStyle(fontSize: 15),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 12),
                children: <TextSpan>[
                  TextSpan(text: '2012'),
                  TextSpan(text: ' ∙ '),
                  TextSpan(text: articleAbstract.correspondingAuthor),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Placeholder(
                color: Colors.blueGrey,
                fallbackHeight: 200,
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 10),
                children: <TextSpan>[
                  TextSpan(text: 'Hypothesis & Theory'),
                  TextSpan(text: ' ∙ '),
                  TextSpan(text: articleAbstract.journal),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                articleAbstract.articleAbstract,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ActionBar(),
          ],
        ),
      ),
    );
  }
}
