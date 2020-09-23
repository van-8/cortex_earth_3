import 'package:cortex_earth_3/widgets/issue_detail.dart';
import 'package:cortex_earth_3/widgets/issue_tile.dart';
import 'package:cortex_earth_3/widgets/issues_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/controllers/issueController.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:cortex_earth_3/constants.dart';

class IssuesListview extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<IssueController>(
            init: Get.put<IssueController>(IssueController()),
            builder: (IssueController issueController) {
              if (issueController != null && issueController.issues != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: issueController.issues.length,
                    itemBuilder: (_, index) {
                      return IssueTile(
                        uid: controller.user.uid,
                        issue: issueController.issues[index],
                        onTap: () {
                          showCupertinoModalBottomSheet(
                              barrierColor: barrierColor,
                              expand: false,
                              context: context,
                              builder: (context, scrollController) =>
                                  IssueDetailScreen(
                                    issue: issueController.issues[index],
                                  ));
                        },
                      );
                    },
                  ),
                );
              } else {
                return Text('   loading...');
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: kGradientGreenBlue),
          child: Icon(Icons.add),
        ),
        onPressed: () {
          showCupertinoModalBottomSheet(
              barrierColor: barrierColor,
              expand: false,
              context: context,
              builder: (context, scrollController) => IssueAddScreen());
        },
      ),
    );
  }
}
