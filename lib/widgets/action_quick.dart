import 'package:cortex_earth_3/widgets/icon_gradient.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

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
                  onPressed: () {},
                  icon: GradientIcon(Mdi.tagOutline, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(
                      Mdi.checkBoxOutline, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(Mdi.playlistPlus, 22, kGradientGreenBlue)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(Mdi.feather, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(Mdi.circleSlice8, 22, kGradientGreenBlue)),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(Mdi.share, 22, kGradientGreenBlue)),
            ],
          ),
        ],
      ),
    );
  }
}
