import 'package:cortex_earth_3/widgets/synapse_bottomsheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cortex_earth_3/constants.dart';

import 'actionbar.dart';

class FigureImageCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FigureImageCarouselState();
  }
}

class _FigureImageCarouselState extends State<FigureImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _saveFigure();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          Text(
            "Figure 1",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 4.0,
                height: 4.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }

  void _saveFigure() {
    showCupertinoModalBottomSheet(
        barrierColor: Colors.black87,
        context: context,
        builder: (context, scrollController) => Material(
              child: Container(
                // height: MediaQuery.of(context).size.height / 2,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Figure 1',
                      style: kArticleTitle,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lisa Feldman Barrett 2016',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    SizedBox(height: 20),
                    _buildCaption(),
                    ActionBar(),
                  ],
                ),
              ),
            ));
  }

  Widget _buildCaption() {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          child: RichText(
              text: TextSpan(
            style: kArticleBodyText,
            children: [
              TextSpan(
                  text:
                      'The classical view of emotion. The classical view of emotion includes basic emotion theories (e.g. for a review, see'),
              TextSpan(
                  text: ' Tracy and Randles, 2011 ',
                  style: kArticleBodyTextSynapse,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _showTracyRandles();
                    }),
              TextSpan(text: 'causal appraisal theories (e.g. '),
              TextSpan(
                  text: 'Scherer 2009',
                  style: kArticleBodyTextSynapse,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _showScherer();
                    }),
              TextSpan(text: ', '),
              TextSpan(
                  text: 'Roseman 2011',
                  style: kArticleBodyTextSynapse,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _showRoseman();
                    }),
              TextSpan(
                  text:
                      ') and theories of emotion that rely on black-box functionalism (Davis, 1992; Anderson and Adolphs, 2014). Each emotion faculty is assumed to have its own innate ‘essence’ that distinguishes it from all other emotions. This might be a Lockean essence (an underlying causal mechanism that all in- stances of an emotion category share, making them that kind of emotion and not some other kind of emotion, depicted by the circles in the figure). Lockean essences might be a biological, such as a set of dedicated neurons, or psychological, such as a set of evaluative mechanisms called ‘appraisals’. An emotion category is usually assumed to have a Platonic essence [a physical fingerprint that instances of that emotion share, but that other emotions do not, such a set of facial movements (an ‘ex- pression’), a pattern of autonomic nervous system activity, and/or a pattern of appraisals]. Of course, no one is expecting complete invariance, but it is assumed that in- stances of a category are similar enough to be easily diagnosed as the same emotion using objective (perceiver-independent) measures alone.'),
            ],
          )),
        ),
      ),
    );
  }

  void _showRoseman() {
    showCupertinoModalBottomSheet(
        expand: false,
        barrierColor: Colors.black87,
        context: context,
        builder: (context, scrollController) => Material(
            child: SynapseBottom(title: null, author: null, content: null)));
  }

  void _showScherer() {
    showCupertinoModalBottomSheet(
        expand: false,
        barrierColor: Colors.black87,
        context: context,
        builder: (context, scrollController) => Material(
                child: SynapseBottom(
              title:
                  'Emotions are emergent processes: they require a dynamic computational architecture',
              author: 'Scherer, K.R. (2009)',
              content:
                  'Philosophical Transactions of the Royal Society B: Biological Sciences, 364 (1535), 3459–74.',
            )));
  }

  void _showTracyRandles() {
    showCupertinoModalBottomSheet(
        expand: false,
        barrierColor: Colors.black87,
        context: context,
        builder: (context, scrollController) => Material(
                child: SynapseBottom(
              title:
                  'Four models of basic emotions: a review of Ekman and Cordaro, Izard, Levenson, and Panksepp and Watt',
              author: 'Tracy, J.L., Randles, D. (2011)',
              content: 'Emotion Review, 3(4), 397–405',
            )));
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1427&q=80',
  'https://images.unsplash.com/photo-1576086476234-1103be98f096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80',
  'https://images.unsplash.com/photo-1579684288538-c76a2fab9617?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1903&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${imgList.indexOf(item)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
