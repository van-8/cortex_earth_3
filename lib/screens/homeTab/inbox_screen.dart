import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/postController.dart';

import 'package:cortex_earth_3/widgets/post_tile.dart';
import 'package:cortex_earth_3/widgets/post_detail.dart';
import 'package:cortex_earth_3/widgets/post_add.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cortex_earth_3/widgets/filterbar.dart';

import '../../constants.dart';

class InboxScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<PostController>(
            init: Get.put<PostController>(PostController()),
            builder: (PostController postController) {
              if (postController != null && postController.posts != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: postController.posts.length,
                    itemBuilder: (_, index) {
                      return PostTile(
                        uid: controller.user.uid,
                        post: postController.posts[index],
                        onTap: () {
                          showCupertinoModalBottomSheet(
                              barrierColor: barrierColor,
                              context: context,
                              builder: (context, scrollController) =>
                                  PostDetail(
                                    post: postController.posts[index],
                                  ));
                        },
                      );
                    },
                  ),
                );
              } else {
                return Text('loading...');
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  showCupertinoModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context, controller) => FilterBar());
                },
                icon: Icon(Icons.filter_list),
                label: Text('Filter'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Icon(Icons.add),
        ),
        onPressed: () {
          showCupertinoModalBottomSheet(
              barrierColor: Colors.black87,
              expand: false,
              context: context,
              builder: (context, scrollController) => PostAddScreen());
        },
      ),
    );
  }
}

// 'Imports emails from a work email address, which can be transformed into Todos, etc. Necessary feature, as most work in 2020 is communicated through email, and so this stream must be sunk into the app or it becomes useless.'),
