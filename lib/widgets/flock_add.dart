import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class FlockAddScreen extends GetWidget<AuthController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _memberCountController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _iconMdiCodepointController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
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
      ),
    );
  }

  Widget _buildMainInput() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
        child: TextFormField(
            autofocus: true,
            controller: _nameController,
            decoration: InputDecoration(
                hintText: 'Flock name...', border: InputBorder.none)));
  }

  Widget _buildDetails() {
    return Material(
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: TextFormField(
                    autofocus: false,
                    maxLines: null,
                    controller: _aboutController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: 'About us...', border: InputBorder.none))),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Material(
      child: Row(
        children: [
          Icon(Mdi.pound, size: 12, color: kIconActiveColor),
          Container(
              width: 40,
              child: TextFormField(
                  autofocus: false,
                  controller: _memberCountController,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: ' ...', border: InputBorder.none))),
          Icon(Mdi.nullIcon, size: 12, color: kIconActiveColor),
          Container(
              width: 60,
              child: TextFormField(
                  autofocus: false,
                  controller: _iconMdiCodepointController,
                  style: kFlockAddTextsize,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: ' .......', border: InputBorder.none))),
          Icon(Mdi.owl, size: 12, color: kIconActiveColor),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 120,
              child: TextFormField(
                  autofocus: false,
                  controller: _nicknameController,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'nickname', border: InputBorder.none))),
          Spacer(),
          FlatButton(
            child: Text(
              'Create',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () {
              if (_nameController.text != '') {
                Database().addFlock(
                  controller.user.uid,
                  _nameController.text,
                  _aboutController.text,
                  int.parse(_memberCountController.text),
                  _nicknameController.text,
                  _iconMdiCodepointController.text,
                );
                _nameController.clear();
                _aboutController.clear();
                _memberCountController.clear();
                _nicknameController.clear();
                _iconMdiCodepointController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
