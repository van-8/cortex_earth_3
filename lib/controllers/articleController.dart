import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/article.dart';
import 'package:cortex_earth_3/services/database.dart';

class ArticleController extends GetxController {
  Rx<List<ArticleModel>> articlesList = Rx<List<ArticleModel>>();

  List<ArticleModel> get articles => articlesList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    articlesList.bindStream(
        Database().articlesStream(uid)); //stream coming from firebase
  }
}
