import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/project.dart';
import 'package:cortex_earth_3/services/database.dart';

class ProjectController extends GetxController {
  Rx<List<ProjectModel>> projectList = Rx<List<ProjectModel>>();

  List<ProjectModel> get projects => projectList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    projectList.bindStream(
        Database().projectStream(uid)); //stream coming from firebase
  }
}
