import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:cortex_earth_3/widgets/todo_add.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/todoController.dart';
import 'package:cortex_earth_3/widgets/todo_tile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TodoScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.0),
          GetX<TodoController>(
            init: Get.put<TodoController>(TodoController()),
            builder: (TodoController todoController) {
              if (todoController != null && todoController.todos != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (_, index) {
                      return TodoTile(
                        uid: controller.user.uid,
                        todo: todoController.todos[index],
                        onTap: () {},
                      );
                    },
                  ),
                );
              } else {
                return Text('loading...');
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showCupertinoModalBottomSheet(
              expand: false,
              barrierColor: Colors.black87,
              context: context,
              builder: (context, scrollController) => Material(
                    child: TodoAddScreen(),
                  ));
        },
      ),
    );
  }
}
