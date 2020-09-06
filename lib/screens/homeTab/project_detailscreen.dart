import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/project.dart';
import 'package:cortex_earth_3/widgets/synapse_bottomsheet.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProjectDetailScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailScreen({Key key, @required this.project})
      : super(key: key);
  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  int _tabIndex = 1;
  final List<String> _tabs = [
    'Dashboard',
    'Tasks',
    'Issues',
    'Data',
    'Synapses',
    'References',
    'Methods',
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
