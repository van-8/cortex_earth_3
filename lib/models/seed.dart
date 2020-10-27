import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/article.dart';
import 'synapse.dart';

class SeedModel {
  String seedID;
  String name;
  String description;
  bool isFaved;
  Timestamp dateCreated;
  List<ArticleModel> articles;
  List<SynapseModel> synapses;
  //TODO: Refactor all articles, synapses, etc as a single type of object and then extend? Would make Lists easier. Seed and cascade are the same??

  SeedModel({this.seedID, this.name, this.isFaved});

  SeedModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    seedID = documentSnapshot.documentID;
    name = documentSnapshot.data["name"];
    description = documentSnapshot.data["description"];
    isFaved = documentSnapshot.data["isFaved"];
  }
}
