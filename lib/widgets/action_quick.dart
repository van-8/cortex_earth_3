import 'package:cortex_earth_3/widgets/icon_gradient.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

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
                  icon: GradientIcon(
                      Mdi.tagOutline,
                      22,
                      LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight))),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(
                      Mdi.checkBoxOutline,
                      22,
                      LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight))),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(
                      Mdi.playlistPlus,
                      22,
                      LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(
                      Mdi.feather,
                      22,
                      LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight))),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(
                      Mdi.circleSlice8,
                      22,
                      LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight))),
              IconButton(
                  onPressed: () {},
                  icon: GradientIcon(
                      Mdi.share,
                      22,
                      LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight))),
            ],
          ),
        ],
      ),
    );
  }
}
