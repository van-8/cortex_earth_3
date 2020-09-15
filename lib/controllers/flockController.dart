import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/flock.dart';
import 'package:cortex_earth_3/services/database.dart';

class FlockController extends GetxController {
  Rx<List<FlockModel>> flockList = Rx<List<FlockModel>>();

  List<FlockModel> get flocks => flockList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    flockList
        .bindStream(Database().flockStream(uid)); //stream coming from firebase
  }
}
