import 'package:cortex_earth_3/constants.dart';
import 'package:cortex_earth_3/screens/gardenTab/articles_listscreen.dart';
import 'package:cortex_earth_3/screens/gardenTab/data_listscreen.dart';
import 'package:cortex_earth_3/screens/gardenTab/synapse_listscreen.dart';
import 'package:cortex_earth_3/screens/homeTab/project_detail/project_content.dart';
import 'package:cortex_earth_3/screens/homeTab/project_detail/project_dashboard.dart';
import 'package:cortex_earth_3/screens/homeTab/project_detail/project_issues.dart';
import 'package:cortex_earth_3/screens/homeTab/project_detail/project_methods.dart';
import 'package:cortex_earth_3/screens/homeTab/project_detail/project_tasks.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/project.dart';
import 'package:get/get.dart';

class ProjectDetailScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailScreen({Key key, @required this.project})
      : super(key: key);
  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  Color projectColor = Colors.green;
  final List<String> _tabs = [
    'REFERENCES',
    'SYNAPSES',
    'CONTENT',
    'DASHBOARD',
    'TASKS',
    'ISSUES',
    'DATA',
    'METHODS',
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: _tabs.length,
        initialIndex: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(200, 90),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.black54,
                            size: 14,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.project.name,
                              style: kProjectTitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.group_add,
                                color: kIconActiveColor,
                              ),
                              onPressed: () {
                                Get.snackbar('Add Collaborators', 'Users menu');
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                color: kIconActiveColor,
                              ),
                              onPressed: () {
                                Get.snackbar('Project Settings', 'popup menu');
                              })
                        ],
                      ),
                    ),
                  ),
                  TabBar(
                      indicatorColor: Colors.lightBlue,
                      isScrollable: true,
                      // labelStyle: kArticleTabbarLabel,
                      labelColor: Colors.lightBlue,
                      labelPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      tabs: _tabs.map((_tabTitle) {
                        return Tab(
                          text: _tabTitle,
                        );
                      }).toList())
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ArticlesListScreen(),
              SynapsesListScreen(),
              ProjectContent(project: widget.project),
              ProjectDashboard(),
              ProjectTasks(),
              IssuesListview(),
              DataListScreen(),
              ProjectMethods(),
            ],
          ),
        ),
      ),
    );
  }
}
