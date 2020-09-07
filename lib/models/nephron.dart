import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/models/user.dart';

class NephronModel {
  String nephronID;
  String name;
  String about;
  String readme;
  String iconURL;
  String email;
  String codeOfConduct;
  Timestamp dateCreated;
  DateTime lastUpdate;
  int editorCount;
  int modCount;
  int subscriberCount;
  bool isFavorite;
  String iconMdiCodepoint;
  List<UserModel> editors;
  List<UserModel> board;
  List<UserModel> mods;
  List<PostModel> announcements;
  List<UserModel> workingGroup;
  List<CascadeModel> cascades;

  NephronModel(
      {this.nephronID,
      this.name,
      this.about,
      this.readme,
      this.iconURL,
      this.email,
      this.codeOfConduct,
      this.dateCreated,
      this.lastUpdate,
      this.iconMdiCodepoint,
      this.editorCount,
      this.modCount,
      this.subscriberCount,
      this.isFavorite,
      this.editors,
      this.board,
      this.mods,
      this.announcements,
      this.workingGroup,
      this.cascades});

  NephronModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    nephronID = documentSnapshot.documentID;
    dateCreated = documentSnapshot.data["dateCreated"];
    name = documentSnapshot.data["name"];
    about = documentSnapshot.data["about"];
    subscriberCount = documentSnapshot.data["subscriberCount"];
    iconMdiCodepoint = documentSnapshot.data["iconMdiCodepoint"];
    // isFavorite = documentSnapshot.data["isFavorite"];
    // readme = documentSnapshot.data["readme"];
    // iconURL = documentSnapshot.data["iconURL"];
    // email = documentSnapshot.data["email"];
    // codeOfConduct = documentSnapshot.data["codeOfConduct"];
    // editorCount = documentSnapshot.data["editorCount"];
    // modCount = documentSnapshot.data["modCount"];
    // contributors = documentSnapshot.data["contributors"];
    // tags = documentSnapshot.data["tags"];
  }
}
