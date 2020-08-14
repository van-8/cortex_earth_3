import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagAddScreen extends GetWidget<AuthController> {
  final TextEditingController _tagController = TextEditingController();

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
                    controller: _tagController,
                    decoration: InputDecoration(hintText: 'Tag name...'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        if (_tagController.text != '') {
                          Database().addTag(
                            controller.user.uid,
                            _tagController.text,
                          );
                          _tagController.clear();
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
