import 'package:flutter/material.dart';

class FlockCascadesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildFeatured(),
          _buildAllCascades(),
        ],
      ),
    );
  }

  Widget _buildFeatured() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Column(
        children: [
          Text('List of 5 featured cascades'),
          Text('Want to Discuss'),
          Text('Already Discussed'),
          SizedBox(height: 30),
          Text('TEMPLATES'),
        ],
      ),
    );
  }

  Widget _buildAllCascades() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Column(
        children: [
          Text('List of cascades'),
        ],
      ),
    );
  }
}
