import 'package:cortex_earth_3/screens/homeTab/project_detail/project_credit.dart';
import 'package:flutter/material.dart';

class ProjectDashboard extends StatefulWidget {
  @override
  _ProjectDashboardState createState() => _ProjectDashboardState();
}

class _ProjectDashboardState extends State<ProjectDashboard> {
  String status = 'To Do';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        child: Column(
          children: [
            _buildStatus(),
            Text(
                'Project Dashboard: \nTask Progress, Pinned Issues, Milestones, Dependency Management, etc.',
                textAlign: TextAlign.center),
            SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              height: 1,
              color: Colors.grey[200],
            ),
            Expanded(child: ContributorsList()),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.cyan)),
      child: DropdownButton<String>(
        value: status,
        icon: Icon(Icons.arrow_drop_down),
        onChanged: (String newValue) {
          setState(() {
            status = newValue;
          });
        },
        items: <String>[
          'To Do',
          'In Progress',
          'Blocked',
          'Needs Review',
          'Done'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
