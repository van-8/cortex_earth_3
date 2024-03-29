import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/article.dart';
import 'synapse.dart';

class CascadeModel {
  String cascadeID;
  String name;
  String description;
  bool isFaved;
  Timestamp dateCreated;
  List<ArticleModel> articles;
  List<SynapseModel> synapses;

  CascadeModel({this.cascadeID, this.name, this.isFaved});

  CascadeModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    cascadeID = documentSnapshot.documentID;
    name = documentSnapshot.data["name"];
    description = documentSnapshot.data["description"];
    isFaved = documentSnapshot.data["isFaved"];
  }
}
