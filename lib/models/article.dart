import 'package:cloud_firestore/cloud_firestore.dart';

import 'tag.dart';
import 'user.dart';

class ArticleModel {
  String articleAbstractID;
  String sourceDOI;
  String title;
  String journal;
  Timestamp publicationDate;
  String type;
  String correspondingAuthor; //convert to User Model when I learn Firebase
  List<UserModel> contributors;
  List<TagModel> tags;
  String researchOrganism;
  String keyFigureURL;
  String articleAbstract;
  String content;

  ArticleModel({
    this.articleAbstractID,
    this.sourceDOI,
    this.title,
    this.journal,
    this.publicationDate,
    this.type,
    this.contributors,
    this.correspondingAuthor,
    this.tags,
    this.researchOrganism,
    this.keyFigureURL,
    this.articleAbstract,
    this.content,
  });

  ArticleModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    articleAbstractID = documentSnapshot.documentID;
    publicationDate = documentSnapshot.data["publicationDate"];
    title = documentSnapshot.data["title"];
    journal = documentSnapshot.data["journal"];
    articleAbstract = documentSnapshot.data["articleAbstract"];
    researchOrganism = documentSnapshot.data["researchOrganism"];
    correspondingAuthor = documentSnapshot.data["correspondingAuthor"];
    keyFigureURL = documentSnapshot.data["keyFigureURL"];
    sourceDOI = documentSnapshot.data["sourceDOI"];
    content = documentSnapshot.data["content"];
    type = documentSnapshot.data["type"];
    // contributors = documentSnapshot.data["contributors"];
    // tags = documentSnapshot.data["tags"];
  }
}
