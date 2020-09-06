import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/nephron.dart';
import 'package:cortex_earth_3/services/database.dart';

class NephronController extends GetxController {
  Rx<List<NephronModel>> nephronList = Rx<List<NephronModel>>();

  List<NephronModel> get nephrons => nephronList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    nephronList.bindStream(
        Database().nephronStream(uid)); //stream coming from firebase
  }
}
