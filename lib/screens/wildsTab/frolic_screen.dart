import 'package:cortex_earth_3/screens/wildsTab/boids.dart';
import 'package:flutter/material.dart';

class FrolicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Text(
                'random and fun ways to explore new content and frolic in the intellectual wilds.'),
            BoidsSim(),
          ],
        ));
  }
}
