import 'package:cortex_earth_3/constants.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/task.dart';
import 'package:cortex_earth_3/widgets/icon_gradient.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class TaskDetailScreen extends GetWidget<AuthController> {
  TaskDetailScreen({
    this.uid,
    this.task,
    // this.checkmark,
  });

  final String uid;
  final TaskModel task;
  // bool checkmark;
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: [
            _buildMain(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Container(
                    color: Colors.white,
                    child: SafeArea(
                      child: Column(
                        children: [
                          _buildActionBar(),
                          _buildInputText(),
                          _buildInputActions(),
                          SizedBox(
                              height: MediaQuery.of(context).viewInsets.bottom),
                        ],
                      ),
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

  Widget _buildMain() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(),
          _buildAssigneeDate(),
          _buildTags(),
          _buildDesc(),
          _buildNotified(),
          _buildPosts(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
        // color: Colors.amber,
        padding: EdgeInsets.fromLTRB(14, 14, 14, 4),
        child: Text(task.content, style: kProjectTitle));
  }

  Widget _buildAssigneeDate() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Mdi.accountCircleOutline, color: kIconActiveColor),
                  onPressed: () {
                    Get.snackbar('Assignee pressed', 'ype ype');
                  },
                ),
                Text('Unassigned'),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Mdi.calendarBlankOutline, color: kIconActiveColor),
                  onPressed: () {
                    Get.snackbar('DueDate pressed', 'ype ype');
                  },
                ),
                Text('Due date...')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTags() {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Mdi.tagMultipleOutline,
                  size: 18, color: kIconActiveColor),
              onPressed: () {}),
          Text('Project name, tag name 1, tag name 2',
              style: kSynapseTileSubtitle),
        ],
      ),
    );
  }

  Widget _buildDesc() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Text('Description'),
    );
  }

  Widget _buildNotified() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        color: Colors.grey[200],
        child: Text('3 collaborators subscribed'),
      ),
    );
  }

  Widget _buildPosts() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        color: Colors.grey[100],
        width: double.infinity,
        child: ListView(
          children: [
            ListTile(
              visualDensity: VisualDensity.compact,
              title: Text('Van created this task', style: kPostContent),
              subtitle: Text('2020 Aug 7 at 20:45', style: kPostAuthor),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              title:
                  Text('Elena updated task description', style: kPostContent),
              subtitle: Text('2020 Sep 20 at 10:31', style: kPostAuthor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Mdi.thumbUpOutline, color: kIconActiveColor),
            onPressed: () {
              Get.snackbar('Like this task', 'Add a like');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz, color: kIconActiveColor),
            onPressed: () {
              Get.snackbar('More options',
                  'Delete, leave, copy URL, share, Mark as milestone, mark as Approval');
            },
          ),
          IconButton(
            icon: task.isDone
                ? GradientIcon(Mdi.checkBold, 24, kGradientGreenBlue)
                : Icon(Icons.check, color: kIconActiveColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildInputText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: TextFormField(
          autofocus: false,
          controller: _titleController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'Ask a question or post update...',
              border: InputBorder.none)),
    );
  }

  Widget _buildInputActions() {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Mdi.imageMultiple, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Add image or camera', 'popup selector');
              }),
          IconButton(
              icon: Icon(Icons.link, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Link to item',
                    'link to a synapse, article, data project, nephron, flock, etc.');
              }),
          Spacer(),
          FlatButton(
            child: Text(
              'Send',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
