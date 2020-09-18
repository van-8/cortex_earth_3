import 'package:cortex_earth_3/screens/detailScreens/article_detailscreen.dart';
import 'package:cortex_earth_3/widgets/article_list.dart';
import 'package:cortex_earth_3/widgets/article_tile.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:cortex_earth_3/controllers/authController.dart';

class ArticlesListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: TagList()),
          Expanded(
            flex: 3,
            child: ArticlesList(),
          ),
        ],
      ),
    );
  }
}
