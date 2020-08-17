import 'package:cortex_earth_3/widgets/abstract_tileX.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/articleAbstractController.dart';
import 'package:cortex_earth_3/widgets/abstract_add.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cortex_earth_3/widgets/filterbar.dart';

class ArticlesListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<ArticleAbstractController>(
            init:
                Get.put<ArticleAbstractController>(ArticleAbstractController()),
            builder: (ArticleAbstractController articleAbstractController) {
              if (articleAbstractController != null &&
                  articleAbstractController.abstracts != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: articleAbstractController.abstracts.length,
                    itemBuilder: (_, index) {
                      return AbstractTileX(
                        uid: controller.user.uid,
                        articleAbstract:
                            articleAbstractController.abstracts[index],
                        onTap: () {
                          print('tapped');
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
                      builder: (context, controller) => AbstractAddScreen());
                },
                icon: Icon(Icons.add),
                label: Text('New Abstract'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
