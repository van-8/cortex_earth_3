import 'package:flutter/material.dart';

import '../../../constants.dart';

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
        child: Column(
          children: [
            Text(
                'Project Dashboard: \nTask Progress, Pinned Issues, Milestones, Dependency Management, etc.',
                textAlign: TextAlign.center),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              height: 1,
              color: Colors.grey[200],
            ),
            Text('CONTRIBUTORS'),
            SizedBox(height: 14),
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Conceptualization', style: kProjectCREDIT),
                        Text('Project Administration', style: kProjectCREDIT),
                        Text('Funding Acquisition', style: kProjectCREDIT),
                        Text('Methodology', style: kProjectCREDIT),
                        Text('Investigation', style: kProjectCREDIT),
                        Text('Data Curation', style: kProjectCREDIT),
                        Text('Visualization', style: kProjectCREDIT),
                        Text('Formal Analysis', style: kProjectCREDIT),
                        Text('Writing Draft', style: kProjectCREDIT),
                        Text('Editing', style: kProjectCREDIT),
                        Text('Supervision', style: kProjectCREDIT),
                        Text('Review', style: kProjectCREDIT),
                        Text('Validation', style: kProjectCREDIT),
                        Text('Resources', style: kProjectCREDIT),
                        Text('Software', style: kProjectCREDIT),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Lisa Feldman BARRETT',
                            style: kProjectContributors),
                        Text('Ralph the Wünder LLAMA',
                            style: kProjectContributors),
                        Text('Mike Q. LLAMA III', style: kProjectContributors),
                        Text('6 VENEZUELAN RED LLAMAS',
                            style: kProjectContributors),
                        Text('Terry GILLIAM & Terry JONES',
                            style: kProjectContributors),
                        Text('Mulan', style: kProjectContributors),
                        Text('Simba & Mufasa', style: kProjectContributors),
                        Text('Alladin', style: kProjectContributors),
                        Text('Grumpy, Sleepy', style: kProjectContributors),
                        Text('Belle & Beast', style: kProjectContributors),
                        Text('Lisa Feldman BARRETT',
                            style: kProjectContributors),
                        Text('Philip K DICK', style: kProjectContributors),
                        Text('Elsa & Olaf', style: kProjectContributors),
                        Text('The Knights who say NEE',
                            style: kProjectContributors),
                        Text('JupyterLab', style: kProjectContributors),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
