import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/models/user.dart';

class FlockModel {
  FlockModel(
      {this.flockID,
      this.name,
      this.about,
      this.nickname,
      this.iconURL,
      this.email,
      this.codeOfConduct,
      this.dateCreated,
      this.lastUpdate,
      this.iconMdiCodepoint,
      this.modCount,
      this.memberCount,
      this.isFavorite,
      this.mods,
      this.announcements,
      this.cascades});

  String flockID;
  String name;
  String about;
  String nickname;
  String iconURL;
  String email;
  String codeOfConduct;
  Timestamp dateCreated;
  DateTime lastUpdate;
  int modCount;
  int memberCount;
  bool isFavorite;
  String iconMdiCodepoint;
  List<UserModel> mods;
  List<PostModel> announcements;
  List<CascadeModel> cascades;

  FlockModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    flockID = documentSnapshot.id;
    dateCreated = documentSnapshot.data()["dateCreated"];
    name = documentSnapshot.data()["name"];
    about = documentSnapshot.data()["about"];
    memberCount = documentSnapshot.data()["memberCount"];
    nickname = documentSnapshot.data()["nickname"];
    iconMdiCodepoint = documentSnapshot.data()["iconMdiCodepoint"];
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
