import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'project.dart';
import 'tag.dart';
import 'user.dart';

class SynapseModel {
  String synapseID;
  String content;
  int lineNumber;
  String sourceDOI;
  String notes;
  Timestamp dateCreated;
  UserModel correspondingAuthor;
  List<UserModel> contributors;
  List<TagModel> tags;
  List<CascadeModel> cascadesLinked;
  List<ProjectModel> projectsLinked;

  SynapseModel(
      {this.synapseID,
      this.content,
      this.lineNumber,
      this.sourceDOI,
      this.notes,
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
    notes = documentSnapshot.data["notes"];
  }
}
