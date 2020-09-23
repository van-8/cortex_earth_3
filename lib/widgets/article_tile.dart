import 'package:cortex_earth_3/widgets/actionbar_mini.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/article.dart';

class ArticleTile extends StatelessWidget {
  final String uid;
  final ArticleModel article;
  final Function onTap;

  const ArticleTile({
    Key key,
    this.uid,
    this.article,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: TextStyle(fontSize: 15),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 12),
                children: <TextSpan>[
                  TextSpan(text: '2012'),
                  TextSpan(text: ' ∙ '),
                  TextSpan(text: article.correspondingAuthor),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image(
                image: AssetImage(article.keyFigureURL),
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 10),
                children: <TextSpan>[
                  TextSpan(text: article.type),
                  TextSpan(text: ' ∙ '),
                  TextSpan(text: article.journal),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                article.articleAbstract,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ActionBarMini(),
            SizedBox(height: 10),
            Container(
              height: 1.0,
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}
