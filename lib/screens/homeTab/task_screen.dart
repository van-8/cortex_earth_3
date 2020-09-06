import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:cortex_earth_3/widgets/task_add.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/taskController.dart';
import 'package:cortex_earth_3/widgets/task_tile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TaskScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.0),
          GetX<TaskController>(
            init: Get.put<TaskController>(TaskController()),
            builder: (TaskController taskController) {
              if (taskController != null && taskController.tasks != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: taskController.tasks.length,
                    itemBuilder: (_, index) {
                      return TaskTile(
                        uid: controller.user.uid,
                        task: taskController.tasks[index],
                        onTap: () {},
                      );
                    },
                  ),
                );
              } else {
                return Center(child: Text('loading...'));
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
              expand: false,
              barrierColor: Colors.black87,
              context: context,
              builder: (context, scrollController) => Material(
                    child: TaskAddScreen(),
                  ));
        },
      ),
    );
  }
}
