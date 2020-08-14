import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/todo.dart';
import 'package:cortex_earth_3/services/database.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }
}
