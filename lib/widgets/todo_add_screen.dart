import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoAddScreen extends GetWidget<AuthController> {
  final TextEditingController _todoController = TextEditingController();
  final TextEditingController _todoDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: _todoController,
                    decoration: InputDecoration(hintText: 'Todo name...'),
                  ),
                  TextFormField(
                    controller: _todoDescController,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        if (_todoController.text != '') {
                          Database().addTodo(
                            controller.user.uid,
                            _todoController.text,
                            _todoDescController.text,
                          );
                          _todoController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
