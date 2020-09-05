import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String title;
  String description;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.title,
    this.description,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.documentID;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    title = documentSnapshot["title"];
    description = documentSnapshot["description"];
  }
}
