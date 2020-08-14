import 'package:cortex_earth_3/widgets/todo_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/todoController.dart';
import 'package:cortex_earth_3/controllers/userController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:cortex_earth_3/widgets/todo_tile.dart';

class TodoScreen extends GetWidget<AuthController> {
  // final TextEditingController _todoController = TextEditingController();
  // final TextEditingController _todoDescController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user =
                await Database().getUser(Get.find<AuthController>().user.uid);
          },
          builder: (_) {
            if (_.user.name != null) {
              return Text(_.user.name);
            } else {
              return Text('Loading...');
            }
          },
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
            },
          ),
        ],
      ),
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
          Get.bottomSheet(TodoAddScreen());
        },
      ),
    );
  }
}
