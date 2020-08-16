import 'package:cloud_firestore/cloud_firestore.dart';

import 'tag.dart';
import 'user.dart';

class ArticleAbstractModel {
  String articleAbstractID;
  String sourceDOI;
  String title;
  String journal;
  Timestamp publicationDate;
  //should be User Model if I figure out how to write to Firebase
  String correspondingAuthor;
  List<UserModel> contributors;
  List<TagModel> tags;
  String researchOrganism;
  String keyFigureURL;
  String articleAbstract;

  ArticleAbstractModel({
    this.articleAbstractID,
    this.sourceDOI,
    this.title,
    this.journal,
    this.publicationDate,
    this.contributors,
    this.correspondingAuthor,
    this.tags,
    this.researchOrganism,
    this.keyFigureURL,
    this.articleAbstract,
  });

  ArticleAbstractModel.fromDocumentSnapshot(
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
    // contributors = documentSnapshot.data["contributors"];
    // tags = documentSnapshot.data["tags"];
  }
}
