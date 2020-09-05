import 'package:cloud_firestore/cloud_firestore.dart';
import 'synapse.dart';
import 'user.dart';
import 'todo.dart';

class ProjectModel {
  String projectID;
  String description;
  int taskTotal;
  Timestamp dateCreated;
  UserModel correspondingAuthor;
  List<UserModel> contributors;
  List<SynapseModel> synapses;
  List<TodoModel> todos;

  ProjectModel(
      {this.projectID,
      this.description,
      this.taskTotal,
      this.dateCreated,
      this.correspondingAuthor,
      this.contributors,
      this.synapses});

  ProjectModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    projectID = documentSnapshot.documentID;
    description = documentSnapshot.data["description"];
    taskTotal = documentSnapshot.data["taskTotal"];
    dateCreated = documentSnapshot.data["dateCreated"];
  }
}
