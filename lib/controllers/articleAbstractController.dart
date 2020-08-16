import 'package:get/get.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/articleAbstract.dart';
import 'package:cortex_earth_3/services/database.dart';

class ArticleAbstractController extends GetxController {
  Rx<List<ArticleAbstractModel>> abstractList =
      Rx<List<ArticleAbstractModel>>();

  List<ArticleAbstractModel> get abstracts => abstractList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    abstractList.bindStream(
        Database().abstractStream(uid)); //stream coming from firebase
  }
}
