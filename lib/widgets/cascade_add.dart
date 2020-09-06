import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class CascadeAddScreen extends GetWidget<AuthController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMainInput(),
            _buildDetails(),
            _buildActions(),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMainInput() {
    return Container(
        padding: EdgeInsets.fromLTRB(14, 10, 14, 0),
        child: TextFormField(
            autofocus: true,
            controller: _nameController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Cascade name...', border: InputBorder.none)));
  }

  Widget _buildDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Icon(Mdi.bookmarkOutline),
          Expanded(
              child: TextFormField(
                  autofocus: false,
                  controller: _descController,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                      hintText: ' Description...', border: InputBorder.none))),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Container(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Mdi.accountCircleOutline, color: kIconActiveColor),
                onPressed: () {
                  Get.snackbar('Assignee pressed', 'ype ype');
                },
              ),
              Text('Shared with...'),
            ],
          ),
        ),
        Spacer(),
        FlatButton(
          child: Text(
            'Create',
            style: TextStyle(color: Colors.blueAccent),
          ),
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
      ],
    );
  }
}
