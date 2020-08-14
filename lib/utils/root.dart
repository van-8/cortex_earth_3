import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/userController.dart';

import 'package:cortex_earth_3/screens/navigation.dart';
import 'package:cortex_earth_3/screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return Navigation();
        } else {
          return Login();
        }
      },
    );
  }
}
