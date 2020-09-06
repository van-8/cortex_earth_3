import 'package:flutter/material.dart';

class ProjectDashboard extends StatefulWidget {
  @override
  _ProjectDashboardState createState() => _ProjectDashboardState();
}

class _ProjectDashboardState extends State<ProjectDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        child: Text(
          'Project Dashboard: \nTask Progress, Pinned Issues, Milestones, Dependency Management, etc.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
