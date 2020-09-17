import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cortex_earth_3/constants.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/flockController.dart';
import 'package:cortex_earth_3/widgets/flocks_tile.dart';
import 'package:cortex_earth_3/widgets/flock_add.dart';

import 'flock_detail.dart';

class FlocksScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<FlockController>(
            init: Get.put<FlockController>(FlockController()),
            builder: (FlockController flockController) {
              if (flockController != null && flockController.flocks != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: flockController.flocks.length,
                    itemBuilder: (_, index) {
                      return FlocksTile(
                        uid: controller.user.uid,
                        flock: flockController.flocks[index],
                        onTap: () {
                          showCupertinoModalBottomSheet(
                              barrierColor: Colors.black87,
                              context: context,
                              builder: (context, scrollController) =>
                                  FlockDetailScreen(
                                    flock: flockController.flocks[index],
                                  ));
                        },
                      );
                    },
                  ),
                );
              } else {
                return Center(child: Text('loading...'));
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: kGradientGreenBlue),
          child: Icon(Icons.add),
        ),
        onPressed: () {
          showCupertinoModalBottomSheet(
              barrierColor: Colors.black87,
              expand: false,
              context: context,
              builder: (context, scrollController) => FlockAddScreen());
        },
      ),
    );
  }
}
