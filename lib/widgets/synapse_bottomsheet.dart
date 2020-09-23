import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';
import 'actionbar_garden.dart';

class SynapseBottom extends StatelessWidget {
  final String title, author, content;

  const SynapseBottom({
    Key key,
    @required this.title,
    @required this.author,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kArticleTitle,
          ),
          SizedBox(height: 10),
          Text(author),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(color: Colors.grey),
          ),
          ActionBar(),
        ],
      ),
    );
  }
}
