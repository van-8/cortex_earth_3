import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'package:cortex_earth_3/models/synapse.dart';
import 'package:cortex_earth_3/models/tag.dart';
import 'package:cortex_earth_3/models/todo.dart';
import 'package:cortex_earth_3/models/user.dart';
import 'package:cortex_earth_3/models/article.dart';

//TODO:Refactor so all items have a new array of 'tags',

class Database {
  final Firestore _firestore = Firestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").document(user.id).setData({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").document(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTodo(
    String uid,
    String content,
    String description,
  ) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("todos")
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'description': description,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _firestore
        .collection("users")
        .document(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = List();
      query.documents.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _firestore
          .collection("users")
          .document(uid)
          .collection("todos")
          .document(todoId)
          .updateData({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
// Delete a todo.

  Future<void> addTag(
    String uid,
    String name,
  ) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("tags")
          .add({
        'name': name,
        'isFaved': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<TagModel>> tagStream(String uid) {
    return _firestore
        .collection("users")
        .document(uid)
        .collection("tags")
        .orderBy("name", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TagModel> retVal = List();
      query.documents.forEach((element) {
        retVal.add(TagModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTag(String newValue, String uid, String tagId) async {
    try {
      _firestore
          .collection("users")
          .document(uid)
          .collection("tags")
          .document(tagId)
          .updateData({"name": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addArticle(
    String uid,
    String title,
    String journal,
    String articleAbstract,
    String researchOrganism,
    String correspondingAuthor,
    String keyFigureURL,
    String sourceDOI,
    String content,
    String type,
    // List<UserModel> contributors,
    // List<TagModel> tags,
  ) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("articles")
          .add({
        'publicationDate': Timestamp.now(),
        'title': title,
        'journal': journal,
        'articleAbstract': articleAbstract,
        'researchOrganism': researchOrganism,
        'correspondingAuthor': correspondingAuthor,
        'keyFigureURL': keyFigureURL,
        'sourceDOI': sourceDOI,
        'content': content,
        'type': type,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<ArticleModel>> articlesStream(String uid) {
    return _firestore
        .collection("users")
        .document(uid)
        .collection("articles")
        .orderBy("title", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ArticleModel> retVal = List();
      query.documents.forEach((element) {
        retVal.add(ArticleModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addSynapse(
    String uid,
    String content,
    int lineNumber,
    String sourceDOI,
  ) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("synapses")
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'lineNumber': lineNumber,
        'sourceDOI': sourceDOI,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<SynapseModel>> synapseStream(String uid) {
    return _firestore
        .collection("users")
        .document(uid)
        .collection("synapses")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<SynapseModel> retVal = List();
      query.documents.forEach((element) {
        retVal.add(SynapseModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addCascade(
    String uid,
    String name,
    String description,
  ) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("cascades")
          .add({
        'dateCreated': Timestamp.now(),
        'name': name,
        'description': description,
        'isFaved': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<CascadeModel>> cascadeStream(String uid) {
    return _firestore
        .collection("users")
        .document(uid)
        .collection("cascades")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<CascadeModel> retVal = List();
      query.documents.forEach((element) {
        retVal.add(CascadeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
