import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class ProjectAddScreen extends GetWidget<AuthController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final bool isPinned;

  ProjectAddScreen({
    this.isPinned = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInput(),
              _buildDesc(),
              _buildBasic(),
              _buildTaskActionBar(),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  autofocus: true,
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Name of the project?',
                      border: InputBorder.none))),
          IconButton(
            icon: Icon(
              Mdi.microphone,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              Get.snackbar('Dictation Mode', 'speak your message');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesc() {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Expanded(
            child: TextFormField(
                autofocus: false,
                controller: _descController,
                minLines: 1,
                maxLines: 6,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Describe the purpose of this project',
                    border: InputBorder.none))),
      ),
    );
  }

  Widget _buildBasic() {
    return Material(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width / 2,
              child: Row(
                children: [
                  IconButton(
                    icon:
                        Icon(Mdi.accountCircleOutline, color: kIconActiveColor),
                    onPressed: () {
                      Get.snackbar('User List', 'User search menu');
                    },
                  ),
                  Expanded(
                      child: TextFormField(
                          autofocus: false,
                          controller: _authorController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Corresponding Author',
                              hintStyle: TextStyle(fontSize: 12),
                              border: InputBorder.none))),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width / 2,
              child: Row(
                children: [
                  IconButton(
                    icon:
                        Icon(Mdi.calendarBlankOutline, color: kIconActiveColor),
                    onPressed: () {
                      Get.snackbar('DueDate pressed', 'ype ype');
                    },
                  ),
                  Text(
                    'Due date...',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskActionBar() {
    return Material(
      child: Container(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Mdi.pinOutline, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar(
                    'Pinned pressed', 'Keep this project pinned to top.');
              },
            ),
            IconButton(
              icon: Icon(Mdi.accountMultiplePlus, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Add Collaborators', ' ype');
              },
            ),
            Spacer(),
            FlatButton(
              child: Text(
                'Create',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () {
                if (_nameController.text != '') {
                  Database().addProject(
                    controller.user.uid,
                    _nameController.text,
                    _descController.text,
                    _authorController.text,
                  );
                  _nameController.clear();
                  _descController.clear();
                  _authorController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
