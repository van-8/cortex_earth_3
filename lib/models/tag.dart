import 'package:cloud_firestore/cloud_firestore.dart';

class TagModel {
  String tagID;
  String name;
  bool isFaved;

  TagModel({this.tagID, this.name, this.isFaved});

  TagModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    tagID = documentSnapshot.id;
    name = documentSnapshot.data()["name"];
    isFaved = documentSnapshot.data()["isFaved"];
  }
}
