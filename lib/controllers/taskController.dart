import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/task.dart';
import 'package:cortex_earth_3/services/database.dart';

class TaskController extends GetxController {
  Rx<List<TaskModel>> taskList = Rx<List<TaskModel>>();

  List<TaskModel> get tasks => taskList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    taskList
        .bindStream(Database().taskStream(uid)); //stream coming from firebase
  }
}
