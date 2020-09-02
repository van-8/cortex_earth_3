import 'package:cortex_earth_3/constants.dart';
import 'package:cortex_earth_3/models/article.dart';
import 'package:cortex_earth_3/widgets/action_bar.dart';
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final ArticleModel article;
  final int _tabIndex = 1;
  final List<String> _list = [
    'Synapses',
    'Abstract',
    'Introduction',
    'Biological background',
    'Theory of Constructed Emotion',
    'Selected Implications',
    'Conclusions & Future Direction',
  ];

  ArticleDetailScreen({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: _list.length,
        initialIndex: _tabIndex,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(200, 50),
            child: Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.white,
                    )),
                    TabBar(
                      indicatorColor: Colors.blue,
                      isScrollable: true,
                      labelStyle: kArticleTabbarLabel,
                      labelColor: Colors.blue,
                      tabs: _list.map((String ss) {
                        return Tab(text: ss);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Text('some metadata'),
              _buildAbstract(),
              Text(article.content),
              Text('some metadata'),
              Text('some metadata'),
              Text(article.content),
              Text(article.content),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAbstract() {
    return Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  article.title,
                  style: kArticleTitle,
                ),
              ),
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      article.correspondingAuthor,
                      style: TextStyle(fontSize: 16),
                    )),
                onTap: () {},
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[300],
                width: double.infinity,
                height: 1,
              ),
              Text(article.articleAbstract),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                color: Colors.grey[300],
                width: double.infinity,
                height: 1,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(children: [
                    Text('Research Organism:  ', style: kArticleMetaDataLabel),
                    Text(article.researchOrganism, style: kArticleMetaData)
                  ])),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(children: [
                    Text('Journal:  ', style: kArticleMetaDataLabel),
                    Text(article.journal, style: kArticleMetaData)
                  ])),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(children: [
                    Text('Publication Date:  ', style: kArticleMetaDataLabel),
                    Text('Timestamp converted', style: kArticleMetaData)
                  ])),
              SizedBox(height: 10),
              ActionBar(),
            ],
          ),
        ));
  }
}
