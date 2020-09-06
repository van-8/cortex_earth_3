import 'package:cloud_firestore/cloud_firestore.dart';
import 'tag.dart';
import 'user.dart';

class SynapseModel {
  String synapseID;
  String content;
  int lineNumber;
  String sourceDOI;
  Timestamp dateCreated;
  UserModel correspondingAuthor;
  List<UserModel> contributors;
  List<TagModel> tags;

  SynapseModel(
      {this.synapseID,
      this.content,
      this.lineNumber,
      this.sourceDOI,
      this.dateCreated,
      this.correspondingAuthor,
      this.contributors,
      this.tags});

  SynapseModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    synapseID = documentSnapshot.documentID;
    dateCreated = documentSnapshot.data["dateCreated"];
    content = documentSnapshot.data["content"];
    lineNumber = documentSnapshot.data["lineNumber"];
    sourceDOI = documentSnapshot.data["sourceDOI"];
  }
}
