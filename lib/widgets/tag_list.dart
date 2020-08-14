import 'package:cortex_earth_3/widgets/tag_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/userController.dart';
import 'package:cortex_earth_3/controllers/tagController.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:cortex_earth_3/widgets/tag_add.dart';

class TagList extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text('Searchbar'),
        ),
        GetX<TagController>(
          init: Get.put<TagController>(TagController()),
          builder: (TagController tagController) {
            if (tagController != null && tagController.tags != null) {
              return Expanded(
                child: ListView.builder(
                  itemCount: tagController.tags.length,
                  itemBuilder: (_, index) {
                    return TagTile(
                      uid: controller.user.uid,
                      tag: tagController.tags[index],
                      onTap: () {},
                    );
                  },
                ),
              );
            } else {
              return Text('loading...');
            }
          },
        ),
        FlatButton.icon(
          onPressed: () {
            Get.bottomSheet(TagAddScreen());
          },
          icon: Icon(Icons.add),
          label: Text('New tag'),
        ),
      ],
    );
  }
}
