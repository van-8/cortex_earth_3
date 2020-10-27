import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'package:cortex_earth_3/models/flock.dart';
import 'package:cortex_earth_3/models/nephron.dart';
import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/models/project.dart';
import 'package:cortex_earth_3/models/synapse.dart';
import 'package:cortex_earth_3/models/tag.dart';
import 'package:cortex_earth_3/models/task.dart';
import 'package:cortex_earth_3/models/user.dart';
import 'package:cortex_earth_3/models/article.dart';
import 'package:cortex_earth_3/models/issue.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "title": user.title,
        "description": user.description,
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
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTask(
    String uid,
    String content,
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("tasks").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'isDone': false,
        'priority': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<TaskModel>> taskStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("tasks")
        .orderBy("isDone", descending: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TaskModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(TaskModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTaskisDone(
    bool newValue,
    String uid,
    String taskId,
  ) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(taskId)
          .update({"isDone": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateTaskisPriority(
    bool newValue,
    String uid,
    String taskId,
  ) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(taskId)
          .update({"isPriority": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
// Delete a todo.

  Future<void> addPost(
    String uid,
    String title,
    String authorID,
    String content,
    // bool isArchived,
    // bool isPublished,
    // int likeCount,
    // int dislikeCount,
    // int loveCount,
    // int congratsCount,
    // int questionCount,
    // List<TagModel> tags;
    // List<UserModel> mentions;
    // List<UserModel> privateBetween;
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("posts").add({
        'dateCreated': Timestamp.now(),
        'authorID': authorID,
        'title': title,
        'content': content,
        'isArchived': false,
        'isPublished': false,
        'isRead': false,
        'likeCount': 0,
        'dislikeCount': 0,
        'loveCount': 0,
        'congratsCount': 0,
        'questionCount': 0,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<PostModel>> postsStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("posts")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<PostModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(PostModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addTag(
    String uid,
    String name,
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("tags").add({
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
        .doc(uid)
        .collection("tags")
        .orderBy("name", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TagModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(TagModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTag(String newValue, String uid, String tagId) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tags")
          .doc(tagId)
          .update({"name": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addIssue(
    String uid,
    String title,
    String description,
    int issueNumber,
    int upvoteCount,
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("issues").add({
        'dateCreated': Timestamp.now(),
        'title': title,
        'description': description,
        'issueNumber': issueNumber,
        'isClosed': false,
        'upvoteCount': upvoteCount,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<IssueModel>> issueStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("issues")
        .orderBy("upvoteCount", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<IssueModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(IssueModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateIssueIsClosed(
    bool newValue,
    String uid,
    String issueId,
  ) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("issues")
          .doc(issueId)
          .update({"isClosed": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addUpvoteToIssue(
    String uid,
    String issueId,
  ) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("issues")
          .doc(issueId)
          .update({"upvoteCount": FieldValue.increment(1)});
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
      await _firestore.collection("users").doc(uid).collection("articles").add({
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
        .doc(uid)
        .collection("articles")
        .orderBy("title", descending: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ArticleModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ArticleModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addSynapse(
    String uid,
    String content,
    // int lineNumber,
    String sourceDOI,
    String notes,
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("synapses").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        // 'lineNumber': lineNumber,
        'sourceDOI': sourceDOI,
        'notes': notes,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<SynapseModel>> synapseStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("synapses")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<SynapseModel> retVal = List();
      query.docs.forEach((element) {
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
      await _firestore.collection("users").doc(uid).collection("cascades").add({
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
        .doc(uid)
        .collection("cascades")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<CascadeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(CascadeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addProject(
    String uid,
    String name,
    String summary,
    String correspondingAuthor,
    // bool isPinned,
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("projects").add({
        'dateCreated': Timestamp.now(),
        'name': name,
        'summary': summary,
        'correspondingAuthor': correspondingAuthor,
        // 'isPinned': isPinned,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
//TODO: update projectContent
  // Future<void> updateProjectContent(
  //   String uid,
  //   String text,
  //   String projectID,
  // ) async {
  //   try {
  //     _firestore
  //         .collection("users")
  //         .doc(uid)
  //         .collection("projects")
  //         .doc(projectID)
  //         .updateData({"content": text});
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  Future<void> updateProjectPinned(
      bool newValue, String uid, String projectID) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(projectID)
          .update({"isPinned": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<ProjectModel>> projectStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("projects")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProjectModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ProjectModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addNephron(
    String uid,
    String name,
    String about,
    int subscriberCount,
    String iconMdiCodepoint,
    // List<UserModel> contributors,
    // List<TagModel> tags,
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("nephrons").add({
        'dateCreated': Timestamp.now(),
        'name': name,
        'about': about,
        'subscriberCount': subscriberCount,
        'iconMdiCodepoint': iconMdiCodepoint,
        // 'researchOrganism': researchOrganism,
        // 'correspondingAuthor': correspondingAuthor,
        // 'keyFigureURL': keyFigureURL,
        // 'sourceDOI': sourceDOI,
        // 'content': content,
        // 'type': type,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<NephronModel>> nephronStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("nephrons")
        .orderBy("subscriberCount", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NephronModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(NephronModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addFlock(
    String uid,
    String name,
    String about,
    int memberCount,
    String nickname,
    String iconMdiCodepoint,
    // List<UserModel> contributors,
    // List<TagModel> tags,
  ) async {
    try {
      await _firestore.collection("users").doc(uid).collection("flocks").add({
        'dateCreated': Timestamp.now(),
        'name': name,
        'about': about,
        'memberCount': memberCount,
        'nickname': nickname,
        'iconMdiCodepoint': iconMdiCodepoint,
        // 'researchOrganism': researchOrganism,
        // 'correspondingAuthor': correspondingAuthor,
        // 'keyFigureURL': keyFigureURL,
        // 'sourceDOI': sourceDOI,
        // 'content': content,
        // 'type': type,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<FlockModel>> flockStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("flocks")
        .orderBy("memberCount", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<FlockModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(FlockModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
