import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/tag.dart';
import 'package:cortex_earth_3/services/database.dart';

class TagController extends GetxController {
  Rx<List<TagModel>> tagsList = Rx<List<TagModel>>();

  List<TagModel> get tags => tagsList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    tagsList
        .bindStream(Database().tagStream(uid)); //stream coming from firebase
  }
}
