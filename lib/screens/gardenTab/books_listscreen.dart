import 'package:cortex_earth_3/controllers/authController.dart';
// import 'package:cortex_earth_3/screens/detailScreens/markdown_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:cortex_earth_3/constants.dart';

class BooksListScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          ListTile(
            title: Text('Principles of Neural Design'),
            onTap: () {
              // showCupertinoModalBottomSheet(
              //     barrierColor: barrierColor,
              //     context: context,
              //     builder: (context, scrollController) =>
              //         MarkdownDetailScreen());
            },
          ),
        ],
      ),
    );
  }
}
