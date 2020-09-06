import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class NephronAddScreen extends GetWidget<AuthController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subscriberCountController =
      TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }

  Widget _buildMainInput() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
        child: TextFormField(
            autofocus: true,
            controller: _nameController,
            decoration: InputDecoration(
                hintText: 'Nephron name...', border: InputBorder.none)));
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
              width: 80,
              child: TextFormField(
                  autofocus: false,
                  controller: _subscriberCountController,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: ' ...', border: InputBorder.none))),
          Spacer(),
          FlatButton(
            child: Text(
              'Create',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () {
              if (_nameController.text != '') {
                Database().addNephron(
                  controller.user.uid,
                  _nameController.text,
                  _aboutController.text,
                  int.parse(_subscriberCountController.text),
                );
                _nameController.clear();
                _aboutController.clear();
                _subscriberCountController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
