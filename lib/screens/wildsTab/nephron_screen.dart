import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/nephronController.dart';
import 'package:cortex_earth_3/widgets/nephron_tile.dart';
import 'package:cortex_earth_3/widgets/nephron_add.dart';

class NephronScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<NephronController>(
            init: Get.put<NephronController>(NephronController()),
            builder: (NephronController nephronController) {
              if (nephronController != null &&
                  nephronController.nephrons != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: nephronController.nephrons.length,
                    itemBuilder: (_, index) {
                      return NephronTile(
                        uid: controller.user.uid,
                        nephron: nephronController.nephrons[index],
                        // onTap: () {
                        //   showCupertinoModalBottomSheet(
                        //       barrierColor: Colors.black87,
                        //       context: context,
                        //       builder: (context, scrollController) =>
                        //           NephronDetailScreen(
                        //             project: nephronController.nephrons[index],
                        //           ));
                        // },
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
              builder: (context, scrollController) => NephronAddScreen());
        },
      ),
    );
  }
}
