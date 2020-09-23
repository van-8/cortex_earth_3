import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class IssueAddScreen extends GetWidget<AuthController> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _issueNumberController = TextEditingController();
  final TextEditingController _upvoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMainInput(),
              _buildNotes(),
              _buildDetails(),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Mdi.tag, color: kIconActiveColor),
                    onPressed: () {
                      Get.snackbar('Add a label', 'popup label view');
                    },
                  ),
                  Spacer(),
                  FlatButton(
                    child: Text(
                      'Create',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {
                      if (_titleController.text != '') {
                        Database().addIssue(
                          controller.user.uid,
                          _titleController.text,
                          _descriptionController.text,
                          int.parse(_issueNumberController.text),
                          int.parse(_upvoteController.text),
                        );
                        _titleController.clear();
                        _descriptionController.clear();
                        _issueNumberController.clear();
                        _upvoteController.clear();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainInput() {
    return Container(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
        child: TextFormField(
            autofocus: true,
            minLines: 1,
            maxLines: null,
            controller: _titleController,
            keyboardType: TextInputType.multiline,
            decoration:
                InputDecoration(hintText: 'Title', border: InputBorder.none)));
  }

  Widget _buildNotes() {
    return Container(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
        child: TextFormField(
            autofocus: false,
            maxLines: null,
            controller: _descriptionController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Description', border: InputBorder.none)));
  }

  Widget _buildDetails() {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Mdi.pound, size: 12, color: kIconActiveColor),
            Container(
                width: 50,
                child: TextFormField(
                    autofocus: false,
                    controller: _issueNumberController,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: '  issue#', border: InputBorder.none))),
            Icon(Mdi.bookmarkOutline, color: kIconActiveColor),
            Expanded(
                child: TextFormField(
                    autofocus: false,
                    controller: _upvoteController,
                    // keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                        hintText: ' # upvotes', border: InputBorder.none))),
          ],
        ),
      ),
    );
  }
}
