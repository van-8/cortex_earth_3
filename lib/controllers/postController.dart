import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/services/database.dart';

class PostController extends GetxController {
  Rx<List<PostModel>> postList = Rx<List<PostModel>>();

  List<PostModel> get posts => postList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    postList
        .bindStream(Database().postsStream(uid)); //stream coming from firebase
  }
}
