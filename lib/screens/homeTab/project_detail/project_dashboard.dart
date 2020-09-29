import 'package:cortex_earth_3/screens/homeTab/project_detail/project_credit.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        child: Column(
          children: [
            Text(
                'Project Dashboard: \nTask Progress, Pinned Issues, Milestones, Dependency Management, etc.',
                textAlign: TextAlign.center),
            SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              height: 1,
              color: Colors.grey[200],
            ),
            ContributorsList(),
          ],
        ),
      ),
    );
  }
}
