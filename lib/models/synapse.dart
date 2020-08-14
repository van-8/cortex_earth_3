import 'tag.dart';
import 'user.dart';

class SynapseModel {
  String synapseID;
  String sourceDOI;
  String content;
  int lineNumber;
  UserModel correspondingAuthor;
  List<UserModel> contributors;
  List<TagModel> tags;

  SynapseModel(
      {this.synapseID,
      this.sourceDOI,
      this.content,
      this.lineNumber,
      this.correspondingAuthor,
      this.contributors,
      this.tags});

  //     TagModel.fromDocumentSnapshot(
  //   DocumentSnapshot documentSnapshot,
  // ) {
  //   tagID = documentSnapshot.documentID;
  //   name = documentSnapshot.data["name"];
  //   isFaved = documentSnapshot.data["isFaved"];
  // }
}
