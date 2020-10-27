import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/tag.dart';
import 'user.dart';

class PostModel {
  String id;
  Timestamp dateCreated;
  String title;
  String content;
  bool isArchived;
  bool isPublished;
  bool isRead;
  int likeCount;
  int dislikeCount;
  int loveCount;
  int congratsCount;
  int questionCount;
  String authorID;
  List<TagModel> tags;
  List<UserModel> mentions;
  List<UserModel> privateBetween;

  PostModel(
      {this.id,
      this.dateCreated,
      this.title,
      this.content,
      this.isArchived,
      this.isPublished,
      this.isRead,
      this.likeCount,
      this.dislikeCount,
      this.loveCount,
      this.congratsCount,
      this.questionCount,
      this.authorID,
      this.tags,
      this.privateBetween,
      this.mentions});

  PostModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    dateCreated = documentSnapshot.data()["dateCreated"];
    title = documentSnapshot.data()["title"];
    content = documentSnapshot.data()["content"];
    isArchived = documentSnapshot.data()["isArchived"];
    isPublished = documentSnapshot.data()["isPublished"];
    isRead = documentSnapshot.data()["isRead"];
    likeCount = documentSnapshot.data()["likeCount"];
    dislikeCount = documentSnapshot.data()["dislikeCount"];
    loveCount = documentSnapshot.data()["loveCount"];
    congratsCount = documentSnapshot.data()["congratsCount"];
    questionCount = documentSnapshot.data()["questionCount"];
    authorID = documentSnapshot.data()["authorID"];
    // tags = documentSnapshot.data["tags"];
    // mentions = documentSnapshot.data["mentions"];
    // privateBetween = documentSnapshot.data["privateBetween"];
  }
}
