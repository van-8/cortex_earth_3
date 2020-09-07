import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class PostAddScreen extends GetWidget<AuthController> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _authorIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(),
            _buildContent(),
            _buildTaskActionBar(),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 4, 14, 0),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  autofocus: true,
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Subject...', border: InputBorder.none))),
          // IconButton(
          //   icon: Icon(
          //     Mdi.microphone,
          //     color: Colors.blueAccent,
          //   ),
          //   onPressed: () {
          //     Get.snackbar('Dictation Mode', 'speak your message');
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  autofocus: false,
                  controller: _contentController,
                  minLines: 1,
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Type your message here...',
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

  Widget _buildTaskActionBar() {
    return Material(
      child: Container(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Mdi.accountCircleOutline, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Assignee pressed', 'ype ype');
              },
            ),
            Expanded(
                child: TextFormField(
                    autofocus: false,
                    controller: _authorIDController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Recipients...', border: InputBorder.none))),
            Spacer(),
            FlatButton(
              child: Text(
                'Create',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () {
                if (_titleController.text != '') {
                  Database().addPost(
                    controller.user.uid,
                    _titleController.text,
                    _authorIDController.text,
                    _contentController.text,
                  );
                  _titleController.clear();
                  _authorIDController.clear();
                  _contentController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
