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

  String issueID;
  String title;
  String description;
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
  List<UserModel> participantsNotified;
}
