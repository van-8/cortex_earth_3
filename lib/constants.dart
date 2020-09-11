import 'package:flutter/material.dart';

const TextStyle kTextAction =
    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
const TextStyle kSynapseTileSubtitle =
    TextStyle(fontSize: 10, color: Colors.grey);

const TextStyle kBold = TextStyle(fontWeight: FontWeight.bold);
const TextStyle kArticleTitle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.normal, letterSpacing: -1);
const TextStyle kArticleTabbarLabel = TextStyle(fontSize: 12);
const TextStyle kArticleMetaData = TextStyle(fontSize: 10);
const TextStyle kArticleMetaDataLabel =
    TextStyle(fontSize: 10, fontStyle: FontStyle.italic);

const TextStyle kArticleBodyText =
    TextStyle(fontSize: 14, color: Colors.black87);

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

//Speech to Text
const TextStyle kDictationAutohighlighter =
    TextStyle(fontSize: 10, color: Colors.grey);

//Icons
Color kIconActiveColor = Colors.grey[600];

//Posts
const TextStyle kPostTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -1,
    color: Colors.black54);
const TextStyle kPostAuthor = TextStyle(fontSize: 12, color: Colors.black54);
const TextStyle kPostContent = TextStyle(fontSize: 14, color: Colors.black87);

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
Color kWildsColor = Colors.brown[600];

LinearGradient kGradientGreenBlue = LinearGradient(
    colors: [Colors.greenAccent, Colors.blueAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

//BottomSheet Contants

const Color barrierColor = Colors.black87;

// Slider
Color kSliderActiveColor = Colors.blue;
