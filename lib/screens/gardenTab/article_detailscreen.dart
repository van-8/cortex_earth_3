import 'package:cortex_earth_3/constants.dart';
import 'package:cortex_earth_3/models/article.dart';
import 'package:cortex_earth_3/widgets/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/widgets/article_synapsetile.dart';

class ArticleDetailScreen extends StatefulWidget {
  final ArticleModel article;

  ArticleDetailScreen({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  int _tabIndex = 1;
  bool _synapseable = false;

  final List<String> _list = [
    'Synapses',
    'Abstract',
    'Introduction',
    'Biological background',
    'Theory of Constructed Emotion',
    'Selected Implications',
    'Conclusions & Future Direction',
  ];

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
              _buildIntro(),
              Text('some metadata'),
              Text('some metadata'),
              Text(widget.article.content),
              Text(widget.article.content),
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
                  widget.article.title,
                  style: kArticleTitle,
                ),
              ),
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      widget.article.correspondingAuthor,
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
              Text(widget.article.articleAbstract),
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
                    Text(widget.article.researchOrganism,
                        style: kArticleMetaData)
                  ])),
              // SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(children: [
                    Text('Journal:  ', style: kArticleMetaDataLabel),
                    Text(widget.article.journal, style: kArticleMetaData)
                  ])),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(children: [
                    Text('Publication Date:  ', style: kArticleMetaDataLabel),
                    Text('19 Oct 2016', style: kArticleMetaData)
                  ])),
              SizedBox(height: 10),
              ActionBar(),
            ],
          ),
        ));
  }

  Widget _buildIntro() {
    return Container(
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              _synapseable = !_synapseable;
            });

            Get.snackbar('Longpressed', _synapseable.toString());
          },
          child: SingleChildScrollView(
            child: _synapseable ? _buildReading() : _buildSynapsing(),
          ),
        ));
  }

  Widget _buildReading() {
    return Column(
      children: [
        RichText(
            text: TextSpan(
          style: kArticleBodyText,
          children: _introTextSpans,
        ))
      ],
    );
  }

  Widget _buildSynapsing() {
    return Column(
      children: [
        SynapseableTile(
            text:
                'Ancient philosophers and physicians believed a human mind to be a collection of mental faculties. '),
        Text(
            'Ancient philosophers and physicians believed a human mind to be a collection of mental faculties. '),
        SizedBox(height: 20),
        Text(
            'They divided the mind, not with an understanding of biology or the brain, but to capture the essence of human nature according to their concerns about truth, beauty and ethics. '),
        SizedBox(height: 20),
        Text(
            'The faculties in question have morphed over the millennia, but generally speaking, they encompass mental categories for thinking (cognitions), feeling (emotions) and volition (actions, and in more modern versions, perceptions). '),
      ],
    );
  }

  Widget _synapseTile() {
    return ListTile(
      leading: Icon(Icons.check_circle_outline),
      title: Row(
        children: [],
      ),
    );
  }

  final List<TextSpan> _introTextSpans = [
    TextSpan(
        text:
            'Ancient philosophers and physicians believed a human mind to be a collection of mental faculties. '),
    TextSpan(
        text:
            'They divided the mind, not with an understanding of biology or the brain, but to capture the essence of human nature according to their concerns about truth, beauty and ethics. '),
    TextSpan(
        text:
            'The faculties in question have morphed over the millennia, but generally speaking, they encompass mental categories for thinking (cognitions), feeling (emotions) and volition (actions, and in more modern versions, perceptions). '),
  ];
}
