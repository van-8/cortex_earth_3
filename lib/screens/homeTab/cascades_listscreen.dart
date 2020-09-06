import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:cortex_earth_3/widgets/cascade_add.dart';
import 'package:cortex_earth_3/widgets/cascade_tile.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/cascadeController.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CascadesListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.0),
          GetX<CascadeController>(
            init: Get.put<CascadeController>(CascadeController()),
            builder: (CascadeController cascadeController) {
              if (cascadeController != null &&
                  cascadeController.cascades != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: cascadeController.cascades.length,
                    itemBuilder: (_, index) {
                      return CascadeTile(
                        uid: controller.user.uid,
                        cascade: cascadeController.cascades[index],
                        onTap: () {},
                      );
                    },
                  ),
                );
              } else {
                return Text('   loading...');
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Icon(Icons.add),
        ),
        onPressed: () {
          showCupertinoModalBottomSheet(
              barrierColor: Colors.black87,
              expand: false,
              context: context,
              builder: (context, scrollController) => CascadeAddScreen());
        },
      ),
    );
  }
}
