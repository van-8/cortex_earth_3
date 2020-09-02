import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CascadeAddScreen extends GetWidget<AuthController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Cascade name...'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _descController,
                    decoration: InputDecoration(hintText: 'Description...'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        if (_nameController.text != '') {
                          Database().addCascade(
                            controller.user.uid,
                            _nameController.text,
                            _descController.text,
                          );
                          _nameController.clear();
                          _descController.clear();
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
