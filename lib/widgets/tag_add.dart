import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class TagAddScreen extends GetWidget<AuthController> {
  final TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 14, 0),
                  child: Icon(Mdi.tagMultipleOutline, color: kIconActiveColor)),
              Expanded(
                child: Container(
                    child: TextFormField(
                        autofocus: true,
                        controller: _tagController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Tag name...',
                            border: InputBorder.none))),
              ),
              FlatButton(
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.blueAccent),
                ),
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
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          )
        ],
      ),
    );
  }
}
