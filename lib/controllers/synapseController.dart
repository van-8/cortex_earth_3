import 'package:get/get.dart';
import 'authController.dart';
import 'package:cortex_earth_3/models/synapse.dart';
import 'package:cortex_earth_3/services/database.dart';

class SynapseController extends GetxController {
  Rx<List<SynapseModel>> synapseList = Rx<List<SynapseModel>>();

  List<SynapseModel> get synapses => synapseList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    synapseList.bindStream(
        Database().synapseStream(uid)); //stream coming from firebase
  }
}
