import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/user.dart';
import 'package:flutter/foundation.dart';
import 'issue.dart';

class MilestoneModel {
  MilestoneModel({
    this.milestoneID,
    @required this.title,
    this.description,
    this.owner,
    this.parent,
    this.order,
    this.isClosed,
    this.sortAscending,
    this.issuesOpen,
    this.issuesClosed,
    this.issuesTotal,
    this.dateCreated,
    this.dateUpdated,
    this.dateClosed,
    this.dueDate,
    this.issues,
    this.participants,
  });

  String milestoneID;
  String title;
  String description;
  String owner; //UserModel instead?
  String parent;
  int order;
  bool isClosed;
  bool sortAscending;
  int issuesOpen;
  int issuesClosed;
  int issuesTotal;
  Timestamp dateCreated;
  DateTime dateUpdated;
  DateTime dateClosed;
  DateTime dueDate;
  List<IssueModel> issues;
  List<UserModel> participants;
}
