import 'package:cortex_earth_3/widgets/tag_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/tagController.dart';
import 'package:cortex_earth_3/widgets/tag_add.dart';

class TagList extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetX<TagController>(
          init: Get.put<TagController>(TagController()),
          builder: (TagController tagController) {
            if (tagController != null && tagController.tags != null) {
              return Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: ListView.builder(
                    itemCount: tagController.tags.length,
                    itemBuilder: (_, index) {
                      return TagTile(
                        uid: controller.user.uid,
                        tag: tagController.tags[index],
                        onTap: () {
                          print('TAG ${tagController.tags[index].name} tapped');
                        },
                      );
                    },
                  ),
                ),
              );
            } else {
              return Text('loading...');
            }
          },
        ),
        FlatButton.icon(
          color: Colors.grey[100],
          onPressed: () {
            Get.bottomSheet(TagAddScreen());
          },
          icon: Icon(Icons.add),
          label: Text('tag'),
        ),
        Container(
          color: Colors.grey[100],
          child: Text('Search'),
        ),
      ],
    );
  }
}
