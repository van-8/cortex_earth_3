import 'package:cortex_earth_3/screens/homeTab/project_detail/project_credit.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';

class ProjectTeamScreen extends StatefulWidget {
  @override
  _ProjectTeamScreenState createState() => _ProjectTeamScreenState();
}

class _ProjectTeamScreenState extends State<ProjectTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text('Manage collaborators', style: kSynapseTileSubtitle),
          SizedBox(height: 10),
          Text('CONTRIBUTORS'),
          SizedBox(height: 14),
          ContributorsList(),
        ],
      ),
    );
  }
}
