import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String todoID;
  String content;
  String description;
  Timestamp dateCreated;
  bool done;
  bool priority;

  TodoModel({
    this.todoID,
    this.content,
    this.description,
    this.dateCreated,
    this.done,
    this.priority,
  });

  TodoModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    todoID = documentSnapshot.documentID;
    content = documentSnapshot.data["content"];
    description = documentSnapshot.data["description"];
    dateCreated = documentSnapshot.data["dateCreated"];
    done = documentSnapshot.data["done"];
    priority = documentSnapshot.data["priority"];
  }
}
