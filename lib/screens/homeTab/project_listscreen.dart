import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/projectController.dart';
import 'package:cortex_earth_3/widgets/project_tile.dart';
import 'package:cortex_earth_3/screens/homeTab/project_detail/project_detail.dart';
import 'package:cortex_earth_3/widgets/project_add.dart';

import '../../constants.dart';

class ProjectListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<ProjectController>(
            init: Get.put<ProjectController>(ProjectController()),
            builder: (ProjectController projectController) {
              if (projectController != null &&
                  projectController.projects != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: projectController.projects.length,
                    itemBuilder: (_, index) {
                      return ProjectTile(
                        uid: controller.user.uid,
                        project: projectController.projects[index],
                        onTap: () {
                          showCupertinoModalBottomSheet(
                              barrierColor: barrierColor,
                              context: context,
                              builder: (context, scrollController) =>
                                  ProjectDetailScreen(
                                    project: projectController.projects[index],
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
              barrierColor: barrierColor,
              expand: false,
              context: context,
              builder: (context, scrollController) => ProjectAddScreen());
        },
      ),
    );
  }
}
