import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/models/tag.dart';
import 'synapse.dart';
import 'user.dart';
import 'task.dart';

class ProjectModel {
  String projectID;
  String name;
  String summary;
  String content;
  int taskTotal;
  Timestamp dateCreated;
  String correspondingAuthor;
  bool isPinned;
  int completionPercentage;
  List<UserModel> contributors;
  List<SynapseModel> projectSynapses;
  List<TaskModel> projectTasks;
  List<TagModel> projectTags;
  // List<IssueModel> projectIssues;
  // Color projectColor;

  ProjectModel({
    this.projectID,
    this.name,
    this.summary,
    this.content,
    this.taskTotal,
    this.dateCreated,
    this.correspondingAuthor,
    this.completionPercentage,
    this.isPinned,
    this.contributors,
    this.projectSynapses,
    this.projectTasks,
    this.projectTags,
  });

  ProjectModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    projectID = documentSnapshot.documentID;
    name = documentSnapshot.data["name"];
    summary = documentSnapshot.data["summary"];
    correspondingAuthor = documentSnapshot.data["correspondingAuthor"];
    content = documentSnapshot.data["content"];
    dateCreated = documentSnapshot.data["dateCreated"];
    taskTotal = documentSnapshot.data["taskTotal"];
    isPinned = documentSnapshot.data["isPinned"];
    completionPercentage = documentSnapshot.data["completionPercentage"];
  }
}
