import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/models/project.dart';

import 'user.dart';
import 'tag.dart';

class IssueModel {
  IssueModel({
    this.title,
    this.isOpen,
    this.templateDescription,
    this.author,
    this.participants,
    this.assignee,
    this.project,
    this.dateCreated,
    this.lastUpdated,
    this.milestone,
    this.commentCount,
    this.loveCount,
    this.dislikeCount,
    this.tags,
    this.labels,
    this.posts,
  });

  String title;
  bool isOpen;
  String templateDescription;
  UserModel author;
  UserModel assignee;
  List<UserModel> participants;
  ProjectModel project;
  Timestamp dateCreated;
  DateTime lastUpdated;
  MilestoneModel milestone;
  int commentCount;
  int loveCount;
  int dislikeCount;
  List<TagModel> tags;
  List<LabelModel> labels;
  List<PostModel> posts;
  //notifications?
}
