import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String taskID;
  String content;
  String description;
  Timestamp dateCreated;
  bool isDone;
  bool isPriority;
  // bool isMilestone;
  // bool needsApproval;
  // UserModel approver;
  // UserModel assignee;
  // ProjectModel project;
  // dependent on other tasks;
  // subtasks;

  TaskModel({
    this.taskID,
    this.content,
    this.description,
    this.dateCreated,
    this.isDone,
    this.isPriority,
  });

  TaskModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    taskID = documentSnapshot.documentID;
    content = documentSnapshot.data["content"];
    description = documentSnapshot.data["description"];
    dateCreated = documentSnapshot.data["dateCreated"];
    isDone = documentSnapshot.data["isDone"];
    isPriority = documentSnapshot.data["isPriority"];
  }
}
