import 'package:cortex_earth_3/screens/detailScreens/article_detailscreen.dart';
import 'package:cortex_earth_3/widgets/article_tile.dart';
import 'package:cortex_earth_3/widgets/tag_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/articleController.dart';
import 'package:cortex_earth_3/widgets/article_add.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cortex_earth_3/widgets/filterbar.dart';

import '../../constants.dart';

class ArticlesListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: TagList()),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                GetX<ArticleController>(
                  init: Get.put<ArticleController>(ArticleController()),
                  builder: (ArticleController articleController) {
                    if (articleController != null &&
                        articleController.articles != null) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: articleController.articles.length,
                          itemBuilder: (_, index) {
                            return ArticleTile(
                              uid: controller.user.uid,
                              article: articleController.articles[index],
                              onTap: () {
                                showCupertinoModalBottomSheet(
                                    barrierColor: barrierColor,
                                    context: context,
                                    builder: (context, scrollController) =>
                                        ArticleDetailScreen(
                                          article:
                                              articleController.articles[index],
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
                    FlatButton.icon(
                      onPressed: () {
                        showCupertinoModalBottomSheet(
                            backgroundColor: Colors.grey[800],
                            context: context,
                            builder: (context, controller) =>
                                AbstractAddScreen());
                      },
                      icon: Icon(Icons.add),
                      label: Text('New Article'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
