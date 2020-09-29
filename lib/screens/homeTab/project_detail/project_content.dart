import 'package:cortex_earth_3/models/project.dart';
import 'package:cortex_earth_3/screens/detailScreens/markdown_detail.dart';
import 'package:flutter/material.dart';
// import 'package:markdown_widget/markdown_widget.dart';

class ProjectContent extends StatefulWidget {
  final ProjectModel project;

  const ProjectContent({Key key, @required this.project}) : super(key: key);
  @override
  _ProjectContentState createState() => _ProjectContentState();
}

class _ProjectContentState extends State<ProjectContent> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              _buildMarkdown(),
            ],
          ),
        ),
      ),
    );
  }

  _buildMarkdown() {
    return Expanded(
      child: Container(
        // color: Colors.green,
        child: MarkdownDetailScreen(project: widget.project),
      ),
    );
  }
}
