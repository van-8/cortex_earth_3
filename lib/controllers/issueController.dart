import 'package:cortex_earth_3/models/issue.dart';
import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';

class IssueController extends GetxController {
  Rx<List<IssueModel>> issueList = Rx<List<IssueModel>>();

  List<IssueModel> get issues => issueList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    issueList
        .bindStream(Database().issueStream(uid)); //stream coming from firebase
  }
}
