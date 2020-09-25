import 'package:flutter/material.dart';

const TextStyle kTextAction =
    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
const TextStyle kSynapseTileSubtitle =
    TextStyle(fontSize: 10, color: Colors.grey);

const TextStyle kBold = TextStyle(fontWeight: FontWeight.bold);
const TextStyle kArticleTitle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
// const TextStyle kArticleTabbarLabel = TextStyle(fontSize: 12);
const TextStyle kArticleMetaData = TextStyle(fontSize: 10);
const TextStyle kArticleMetaDataLabel =
    TextStyle(fontSize: 10, fontStyle: FontStyle.italic);

const TextStyle kArticleBodyText =
    TextStyle(fontSize: 14, color: Colors.black87, fontFamily: 'RobotoSlab');

const TextStyle kArticleBodyTextReady =
    TextStyle(fontSize: 14, color: Colors.black38);

const TextStyle kArticleBodyTextSynapse =
    TextStyle(fontSize: 14, color: Colors.blue);

const TextStyle kListViewTitleStyle =
    TextStyle(color: Colors.black87, fontWeight: FontWeight.w300);

const TextStyle kProjectCREDIT =
    TextStyle(color: Colors.black87, fontWeight: FontWeight.w300, fontSize: 12);

const TextStyle kProjectContributors =
    TextStyle(color: Colors.blue, fontWeight: FontWeight.w300, fontSize: 12);

//Flock Add Text Size
const TextStyle kFlockAddTextsize = TextStyle(fontSize: 10, color: Colors.grey);

//Speech to Text
const TextStyle kDictationAutohighlighter =
    TextStyle(fontSize: 10, color: Colors.grey);

//Posts
const TextStyle kPostTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -1,
    color: Colors.black54);
const TextStyle kPostAuthor = TextStyle(fontSize: 12, color: Colors.black54);
const TextStyle kPostContent = TextStyle(fontSize: 14, color: Colors.black87);

//Nephron
TextStyle kNephronTileEfferentDays =
    TextStyle(fontSize: 12, color: Colors.grey[700]);

TextStyle kNephronTileEfferentDaysOverdue =
    TextStyle(fontSize: 12, color: Colors.red[300]);

const TextStyle kManuscriptTimeline =
    TextStyle(fontSize: 10, color: Colors.grey);

//Projects
const TextStyle kProjectTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -1,
    color: Colors.black);

//Colors
// how to convert color value to string
Color pickercolor = Color(0xff5EFFC0);
int colorINT = pickercolor.value;

Color kHomeColor = Colors.lightBlue;
Color kGardenColor = Colors.lightGreen[700];
Color kWildsColor = Colors.brown[800];
Color kNephronColor = Colors.brown[800];
Color kNephronUnselectedColor = Colors.white;
Color kNephronPressedColor = Colors.brown[300];

LinearGradient kGradientGreenBlue = LinearGradient(
    colors: [Colors.greenAccent, Colors.blueAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

LinearGradient kGradientBrownTan = LinearGradient(
    colors: [Colors.brown[200], kWildsColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

//Icons
Color kIconActiveColor = Colors.grey[600];

//BottomSheet Contants

const Color barrierColor = Colors.black87;

// Slider
Color kSliderActiveColor = Colors.blue;

// Figure Slider Parameter
TextStyle kFigureSliderLabelStyle =
    TextStyle(color: Colors.white70, fontSize: 16);
TextStyle kFigureSliderVarStyle =
    TextStyle(color: Colors.white70, fontSize: 24);
const EdgeInsets kFigureSliderLabelpadding =
    EdgeInsets.symmetric(horizontal: 20);
