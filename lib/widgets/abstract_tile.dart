import 'package:cortex_earth_3/models/articleAbstract.dart';
import 'package:flutter/material.dart';

class ArticleAbstractTile extends StatelessWidget {
  final String uid;
  final ArticleAbstractModel articleAbstract;
  // final String figureURL;
  final Function onTap;

  const ArticleAbstractTile({
    Key key,
    this.uid,
    this.articleAbstract,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            _buildPreview(),
            _buildByline(),
            _buildActionBar(),
          ],
        ),
      ),
    );
  }

  _buildPreview() {
    Container(
      child: Column(
        children: [
          Text(articleAbstract.title),
          Container(
            height: 200,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  _buildByline() {
    Container(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: articleAbstract.journal),
                TextSpan(text: ' ∙ '),
                TextSpan(text: articleAbstract.publicationDate.toString()),
                TextSpan(text: ' ∙ '),
                TextSpan(text: 'Hypothesis & Theory'),
              ],
            ),
          ),
          Text(
            articleAbstract.contributors.toString(),
            overflow: TextOverflow.fade,
          ),
          Text(
            articleAbstract.articleAbstract,
            overflow: TextOverflow.ellipsis,
            maxLines: 9,
          ),
        ],
      ),
    );
  }

  _buildActionBar() {
    Container(
      height: 30.0,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
          IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
    );
  }
}
