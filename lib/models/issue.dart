import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'user.dart';
import 'tag.dart';
import 'post.dart';
import 'project.dart';
import 'milestone.dart';
import 'label.dart';

class IssueModel {
  IssueModel({
    this.issueID,
    @required this.title,
    this.description,
    this.issueNumber,
    this.isClosed,
    this.templateDescription,
    this.author,
    this.participants,
    this.assignee,
    this.project,
    this.dateCreated,
    this.lastUpdated,
    this.milestone,
    this.commentCount,
    this.upvoteCount,
    this.downvoteCount,
    this.tags,
    this.labels,
    this.posts,
  });

  String issueID;
  String title;
  String description;
  bool isClosed;
  int issueNumber;
  Timestamp dateCreated;
  int upvoteCount;
  int downvoteCount;
  //Not implemented yet...
  String templateDescription;
  UserModel author;
  UserModel assignee;
  List<UserModel> participants;
  ProjectModel project;
  DateTime lastUpdated;
  MilestoneModel milestone;
  int commentCount;
  List<TagModel> tags;
  List<LabelModel> labels;
  List<PostModel> posts;
  List<UserModel> participantsNotified;

  IssueModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    issueID = documentSnapshot.documentID;
    dateCreated = documentSnapshot.data["dateCreated"];
    title = documentSnapshot.data["title"];
    description = documentSnapshot.data["description"];
    issueNumber = documentSnapshot.data["issueNumber"];
    isClosed = documentSnapshot.data["isClosed"];
    upvoteCount = documentSnapshot.data["upvoteCount"];
  }
}
