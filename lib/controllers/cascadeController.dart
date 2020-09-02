import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/cascade.dart';
import 'package:cortex_earth_3/services/database.dart';

class CascadeController extends GetxController {
  Rx<List<CascadeModel>> cascadeList = Rx<List<CascadeModel>>();

  List<CascadeModel> get cascades => cascadeList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    cascadeList.bindStream(
        Database().cascadeStream(uid)); //stream coming from firebase
  }
}
