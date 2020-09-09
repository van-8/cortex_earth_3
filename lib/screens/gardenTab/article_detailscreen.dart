import 'package:cortex_earth_3/constants.dart';
import 'package:cortex_earth_3/models/article.dart';
import 'package:cortex_earth_3/widgets/action_bar.dart';
import 'package:cortex_earth_3/widgets/image_carousel.dart';
import 'package:cortex_earth_3/widgets/synapse_bottomsheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/widgets/article_synapsetile.dart';
import 'package:mdi/mdi.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ArticleDetailScreen extends StatefulWidget {
  final ArticleModel article;

  ArticleDetailScreen({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  int _tabIndex = 1;
  bool _isSynapsing = false;

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
              _buildSynapses(),
              _buildAbstract(),
              _buildIntro(),
              _buildSection2(),
              Text(widget.article.content),
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

  Widget _buildSection2() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Text(
              'A brain is a network of billions of communicating neurons, bathed in chemicals called neurotransmitters, which permit neurons to pass information to one another (Doya, 2008; Bargmann, 2012). The firing of a single neuron (or a small population of neurons) repre- sents the presence or absence of some feature at a moment in time (Deneve, 2008; Deneve and Jardri, 2016). However, a given neu- ron (or group of neurons) represents different features from moment to moment (e.g. Stokes et al., 2013; Spillmann et al., 2015) because many neurons synapse onto one (many-to-one connectivity), and a neuron’s receptive field depends on the information it receives (i.e. depends on its neural context in the moment; McIntosh, 2004). Conversely, one neuron also synapses on many other neurons [one-to-many connectivity (Sporns, 2011; Sterling and Laughlin, 2015)] to help implement instances of different psychological categories. As a consequence, neurons are multipurpose [for evidence and discussion, see (Barrett and Satpute, 2013; Anderson, 2014; Anderson and Finlay, 2014)], even in subcortical regions like the amygdala (Cerf, personal communication, 30 July 2015) \n \n     When the brain is viewed as a massive network, rather than a single organ or a collection of ‘mental modules’, it becomes apparent that this one anatomic structure of neurons can create an astounding number of spatiotemporal patterns, making the brain a network of high complexity (Sporns, 2011; Bullmore and Sporns, 2012; Rigotti et al., 2013). Natural selection prefers high complexity systems as they can reconfigure themselves into a multitude of different states (Whitacre, 2010; Whitacre and Bender, 2010; Sterling and Laughlin, 2015). \n \n     The brain achieves complexity through degeneracy (Edelman and Gally, 2001), the capacity for dissimilar represen- tations (e.g. different sets of neurons) to give rise to instances of the same category (e.g. anger) in the same context (i.e. many-to- one mappings of structure to function). Degeneracy is ubiqui- tous in biology, from the workings inside a single cell to distrib- uted brain networks (e.g. see Tononi et al., 1999; Edelman and Gally, 2001; Marder and Taylor, 2011). Natural selection favors systems with degeneracy because they are high in complexity and robust to damage (Whitacre and Bender, 2010). Degeneracy explains why Roger, the patient who lost his limbic circuitry to herpes simplex type I encephalitis, still experiences emotions (Feinstein et al., 2010) and why monozygotic twins with fully cal- cified basolateral sectors of the amygdala [due to Urbach- Wiethe disease (UWD)] have markedly different emotional cap- acity, despite genetic and environmental similarity (Becker et al., 2012; Mihov et al., 2013). Degeneracy also explains how a characteristic can be highly heritable even without a single set of necessary and sufficient genes (e.g. Turkheimer et al., 2014).'),
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: GestureDetector(
              onLongPress: () {
                setState(() {
                  _isSynapsing = !_isSynapsing;
                });
              },
              child: SingleChildScrollView(
                child: _isSynapsing ? _buildSynapsing() : _buildReading(),
              ))),
      floatingActionButton: _isSynapsing
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isSynapsing = !_isSynapsing;
                  Get.snackbar('Items synapsed', '',
                      snackPosition: SnackPosition.BOTTOM);
                });
              },
              child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Icon(Mdi.checkboxMarkedCircleOutline)))
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildReading() {
    return Column(
      children: [
        RichText(
            text: TextSpan(
          style: kArticleBodyText,
          children: [
            TextSpan(
                text:
                    'Ancient philosophers and physicians believed a human mind to be a collection of mental faculties. '),
            TextSpan(
                text:
                    'They divided the mind, not with an understanding of biology or the brain, but to capture the essence of human nature according to their concerns about truth, beauty and ethics. '),
            TextSpan(
                text:
                    'The faculties in question have morphed over the millennia, but generally speaking, they encompass mental categories for thinking (cognitions), feeling (emotions) and volition (actions, and in more modern versions, perceptions). These mental categories symbolize a cherished narrative about human nature in Western civilization: that emotions (our inner beast) and cognitions (evolution crowning achievemnt) battle or cooperate to control behavior.'),
            TextSpan(
                text: '[1]',
                style: kArticleBodyTextSynapse,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _showFootnote1();
                  }),
            TextSpan(text: '\n \n'),
            TextSpan(text: 'The classical view of emotion'),
            TextSpan(text: ' (Figure 1) '),
            TextSpan(
                text:
                    'was forged in these ancient ideas. Affective neuroscience takes its inspiration from this faculty-based approach. Scientists begin with emotion concepts that are most recognizably English ('),
            TextSpan(
                text: 'Pavlenko 2014',
                style: kArticleBodyTextSynapse,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _showPav();
                  }),
            TextSpan(text: ', '),
            TextSpan(
                text: 'Wierzbicka 2014',
                style: kArticleBodyTextSynapse,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _showWierz();
                  }),
            TextSpan(
                text:
                    ') such as anger, sadness, fear, and disgust, and search for their elusive biological essences (i.e. their neural signatures or fingerprints), usually in subcortical regions. This inductive approach assumes that the emotion categories we experience and perceive as distinct must also be distinct in nature.'),
          ],
        )),
        ImageCarousel(),
        Text(
            'If the history of science has taught us anything, however, it is that human experiences rarely reveal the way that the nat- ural world works: ‘Physical concepts are free creations of the human mind, and are not; however, it may seem, uniquely determined by the external world’ (Einstein et al., 1938, p. 33). The last two decades of neuroscience research have brought us to the brink of a paradigm shift in understanding the workings of the brain, setting the stage to revolutionize our study of emo- tions (or any mental category). So in this article, we turn the typical inductive approach on its head. We begin not with men- tal categories but with the structure and function of the brain, and from there deduce what the biological basis of emotions might be. The answer, I suggest, will look something like the theory of constructed emotion (Barrett, 2017), formerly, the con- ceptual act theory of emotion (Barrett, 2006b, 2011a, 2012, 2013, 2014).'),
      ],
    );
  }

  Widget _buildSynapsing() {
    return Column(
      children: [
        SynapseableTile(
            text:
                'Ancient philosophers and physicians believed a human mind to be a collection of mental faculties. '),
        SynapseableTile(
            text:
                'They divided the mind, not with an understanding of biology or the brain, but to capture the essence of human nature according to their concerns about truth, beauty and ethics. '),
        SynapseableTile(
            text:
                'The faculties in question have morphed over the millennia, but generally speaking, they encompass mental categories for thinking (cognitions), feeling (emotions) and volition (actions, and in more modern versions, perceptions). '),
        SynapseableTile(
            text:
                'These mental categories symbolize a cherished narrative about human nature in Western civilization: that emotions (our inner beast) and cognitions (evolution crowning achievemnt) battle or cooperate to control behavior. '),
        SynapseableTile(
            text:
                'That classical view of emotion was forged in these ancient ideas.'),
        SynapseableTile(
            text:
                'Affective neuroscience takes its inspiration from this faculty-based approach.'),
        SynapseableTile(
            text:
                'Scientists begin with emotion concepts that are most recognizably English such as anger, sadness, fear, and disgust, and search for their elusive biological essences (i.e. their neural signatures or fingerprints), usually in subcortical regions. '),
        SynapseableTile(
            text:
                'Aneta Pavlenko, 2014. The Bilingual Mind: And What It Tells Us about Language and Thought.'),
        SynapseableTile(
            text:
                'Anna Wierzbicka, 2014. Imprisoned in English: The Hazards of English as a Default Language'),
        SynapseableTile(
            text:
                'This inductive approach assumes that the emotion categories we experience and perceive as distinct must also be distinct in nature.'),
      ],
    );
  }

  void _showFootnote1() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("[1]"),
          content: Text(
              "Throughout the millennia, with few exceptions, cognitions were thought to reside in the brain, emotions in the body, and then later, emotions were relocated to the parts of the brain that control the body. For example, Aristotle placed both thinking and feeling in organs of the body; Descartes kept emotions in the body and placed cognition in the pineal gland of the brain"),
        );
      },
    );
  }

  void _showPav() {
    showCupertinoModalBottomSheet(
        expand: false,
        barrierColor: barrierColor,
        context: context,
        builder: (context, scrollController) => Material(
                child: SynapseBottom(
              title:
                  'The Bilingual Mind: And What It Tells Us about Language and Thought.',
              author: 'Aneta Pavlenko, 2014',
              content:
                  'If languages influence the way we think, do bilinguals think differently in their respective languages? And if languages do not affect thought, why do bilinguals often perceive such influence? For many years these questions remained unanswered because the research on language and thought had focused solely on the monolingual mind. Bilinguals were either excluded from this research as subjects, or treated as representative speakers of their first languages. ',
            )));
  }

  void _showWierz() {
    showCupertinoModalBottomSheet(
        barrierColor: barrierColor,
        context: context,
        builder: (context, scrollController) => Material(
                child: SynapseBottom(
              title:
                  'Imprisoned in English: The Hazards of English as a Default Language',
              author: 'Anna Wierzbicka, 2014',
              content:
                  'In Imprisoned in English, Anna Wierzbicka argues that in the present English-dominated world, millions of people - including academics, lawyers, diplomats, and writers - can become "prisoners of English", unable to think outside English. In particular, social sciences and the humanities are now increasingly locked in a conceptual framework grounded in English.',
            )));
  }

  Widget _buildSynapses() {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              subtitle: Text('${entries[index]}'),
              leading: Text(
                '${entryLineNum[index]}',
                style: kSynapseTileSubtitle,
              ),
            );
          }),
    );
  }

  final List<String> entries = <String>[
    'We begin not with mental categories but with the structure and function of the brain, and from there deduce what the biological basis of emotions might be. The answer, I suggest, will look something like the theory of constructed emotion (Barrett, 2017), formerly, the con- ceptual act theory of emotion (Barrett, 2006b, 2011a, 2012, 2013, 2014).',
    'For a brain to effectively regulate its body in the world, it runs an internal model of that body in the world.',
    'As an animal\'s integrated physiological state changes constantly throughout the day, its immediate past determines the aspects of the sensory world that concern the animal in the present, which in turn influences what its niche will contain in the immediate future.',
  ];

  final List<String> entryLineNum = <String>[
    '34',
    '145',
    '278',
  ];
}
