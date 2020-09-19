import 'package:cortex_earth_3/widgets/icon_gradient.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

import '../constants.dart';

class QuickActionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.snackbar(
                        'Manage tags', 'Tag screen pops up, add new tag');
                  },
                  icon: GradientIcon(Mdi.tagOutline, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {
                    Get.snackbar('Manage tasks',
                        'List of tasks connected to this item, create new task');
                  },
                  icon: GradientIcon(
                      Mdi.checkBoxOutline, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {
                    Get.snackbar('Manage Cascades',
                        'List of cascades connected to this item, link new cascade');
                  },
                  icon: GradientIcon(Mdi.playlistPlus, 22, kGradientGreenBlue)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.snackbar('Manage Flocks',
                        'Flocks this item has been shared in, add to Flock.');
                  },
                  icon: GradientIcon(Mdi.feather, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {
                    Get.snackbar('Manage Projects',
                        'Projects this item is part of, add to project.');
                  },
                  icon: GradientIcon(Mdi.circleSlice8, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {
                    Get.snackbar('Share',
                        'List of users you have shared this item with, share directly to inbox of a new user.');
                  },
                  icon: GradientIcon(Mdi.share, 22, kGradientGreenBlue)),
            ],
          ),
        ],
      ),
    );
  }
}
