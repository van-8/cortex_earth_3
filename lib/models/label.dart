import 'package:cortex_earth_3/models/issues.dart';
import 'package:flutter/foundation.dart';

class LabelModel {
  String labelID;
  @required
  String name;
  String description;
  int issueCount;
  String color;
  String owner; //UserModel instead?
  List<IssueModel> issues;
}
