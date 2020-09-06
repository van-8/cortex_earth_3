import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/models/tag.dart';
import 'synapse.dart';
import 'user.dart';
import 'task.dart';

class ProjectModel {
  String projectID;
  String name;
  String description;
  int taskTotal;
  Timestamp dateCreated;
  String correspondingAuthor;
  bool isPinned;
  List<UserModel> contributors;
  List<SynapseModel> projectSynapses;
  List<TaskModel> projectTasks;
  List<TagModel> projectTags;
  // List<IssueModel> projectIssues;
  // Color projectColor;

  ProjectModel({
    this.projectID,
    this.name,
    this.description,
    this.taskTotal,
    this.dateCreated,
    this.correspondingAuthor,
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
    description = documentSnapshot.data["description"];
    correspondingAuthor = documentSnapshot.data["correspondingAuthor"];
    // taskTotal = documentSnapshot.data["taskTotal"];
    dateCreated = documentSnapshot.data["dateCreated"];
    isPinned = documentSnapshot.data["isPinned"];
  }
}
