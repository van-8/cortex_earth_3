import 'package:cortex_earth_3/screens/wildsTab/nephron/nephron_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:mdi/mdi.dart';

class MarksDetail extends StatefulWidget {
  @override
  _MarksDetailState createState() => _MarksDetailState();
}

class _MarksDetailState extends State<MarksDetail> {
  // final GlobalKey<ExpansionTileCardState> _cardQuality = GlobalKey();
  // final GlobalKey<ExpansionTileCardState> _cardPolarity = GlobalKey();
  // final GlobalKey<ExpansionTileCardState> _cardWeight = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: Get.height / 2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Text(
                'Marks provide dimensions of evaluation beyond citation count.',
                style: kArticleMetaData,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: RichText(
                  text: TextSpan(
                style: kArticleBodyText,
                children: [
                  TextSpan(text: 'Affirmed by '),
                  TextSpan(
                    text: 'APA Emotion',
                    style: kArticleBodyTextSynapse,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showCupertinoModalBottomSheet(
                            expand: false,
                            barrierColor: barrierColor,
                            context: context,
                            builder: (context, scrollController) {
                              return NephronScreen();
                            });
                      },
                  ),
                  TextSpan(text: ', 2020 Aug 8'),
                ],
              )),
            ),
            _buildList(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Container(
      height: 300,
      // color: Colors.amber,
      child: ListView(
        children: [
          _buildTileEndorse(),
          _buildTileQuality(),
          _buildTileWeight(),
          _buildTilePolarity(),
        ],
      ),
    );
  }

  Widget _buildTileQuality() {
    return ExpansionTileCard(
      title: Row(
        children: [
          Text('Quality'),
          Spacer(),
          Text('9/10'),
        ],
      ),
      leading: Icon(Mdi.textBoxCheckOutline),
      children: [
        // Divider(color: Colors.green),
        ExpansionTileCard(
          elevation: 0,
          title: Row(
            children: [
              Text('Appropriate Test of Hypothesis', style: kArticleMetaData),
              Spacer(),
              Text('2/2', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.check, color: Colors.green),
        ),
        ExpansionTileCard(
          elevation: 0,
          title: Row(
            children: [
              Text('Adequate References', style: kArticleMetaData),
              Spacer(),
              Text('2/2', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.check, color: Colors.green),
        ),
        ExpansionTileCard(
          elevation: 0,
          title: Row(
            children: [
              Text('Data', style: kArticleMetaData),
              Spacer(),
              Text('2/2', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.check, color: Colors.green),
          children: [
            Text('Provided raw data      1/1', style: kArticleMetaData),
            Text('Data presented appropriately      1/1',
                style: kArticleMetaData)
          ],
        ),
        ExpansionTileCard(
          elevation: 0,
          title: Row(
            children: [
              Text('Detailed', style: kArticleMetaData),
              Spacer(),
              Text('2/2', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.check, color: Colors.green),
        ),
        ExpansionTileCard(
          elevation: 0,
          title: Row(
            children: [
              Text('Readability', style: kArticleMetaData),
              Spacer(),
              Text('1/2', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.check, color: Colors.green),
          children: [
            Text('No grammatical or typographic errors 1/1'),
            Text('Provided in more than one language 0/1'),
          ],
        ),
      ],
    );
  }

  Widget _buildTilePolarity() {
    return ExpansionTileCard(
      title: Row(
        children: [
          Text('Polarity'),
          Spacer(),
          Text('0.6'),
        ],
      ),
      leading: Icon(Mdi.atomVariant),
      children: [
        Text('Ratio of readers who *like/dislike* this item'),
        ListTile(
          title: Row(
            children: [
              Text('Negative', style: kArticleMetaData),
              Spacer(),
              Text('78', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Mdi.minus),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Row(
            children: [
              Text('Positive', style: kArticleMetaData),
              Spacer(),
              Text('343', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.add),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildTileWeight() {
    return ExpansionTileCard(
      title: Row(
        children: [
          Text('LTP'),
          Spacer(),
          Text('medium'),
        ],
      ),
      // leading: Icon(Mdi.flare),
      leading: Icon(Mdi.resistor),
      children: [
        // Divider(color: Colors.green),
        ListTile(
          // elevation: 0,
          title: Row(
            children: [
              Text('Novel findings', style: kArticleMetaData),
              Spacer(),
              Text('how to judge?', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.check, color: Colors.green),
        ),
        ListTile(
          title: Row(
            children: [
              Text('# of synapses', style: kArticleMetaData),
              Spacer(),
              Text('348', style: kArticleMetaData),
            ],
          ),
          leading: Icon(Icons.check, color: Colors.green),
        ),
      ],
    );
  }

  Widget _buildTileEndorse() {
    return ExpansionTileCard(
      title: Row(
        children: [
          Text('Endorsed'),
          Spacer(),
          Text(
            'Highly',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
      leading: Icon(Mdi.starFourPoints),
      children: [
        // Divider(color: Colors.green),
        ListTile(
            title: Text('Endorsed by 87% people you follow'),
            trailing: Text('65 ppl')),
      ],
    );
  }
}
