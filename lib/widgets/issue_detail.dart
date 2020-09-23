import 'package:cortex_earth_3/constants.dart';
import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:cortex_earth_3/models/issue.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class IssueDetailScreen extends GetWidget<AuthController> {
  IssueDetailScreen({
    this.uid,
    this.issue,
    // this.checkmark,
  });

  final String uid;
  final IssueModel issue;
  // bool checkmark;
  final TextEditingController _commentController = TextEditingController();

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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(),
          _buildAssigneeDate(),
          _buildLabels(),
          _buildDesc(),
          _buildNotified(),
          _buildPosts(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
        child: Text(issue.title, style: kProjectTitle));
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

  Widget _buildLabels() {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Mdi.tagMultipleOutline,
                  size: 18, color: kIconActiveColor),
              onPressed: () {}),
          Text('Project name, labels', style: kSynapseTileSubtitle),
        ],
      ),
    );
  }

  Widget _buildDesc() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Text('Description'),
    );
  }

  Widget _buildNotified() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        color: Colors.grey[200],
        child: Text('3 collaborators subscribed'),
      ),
    );
  }

  Widget _buildPosts() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        color: Colors.grey[100],
        width: double.infinity,
        child: ListView(
          children: [
            ListTile(
              visualDensity: VisualDensity.compact,
              title: Text('Van created this issue', style: kPostContent),
              subtitle: Text('2020 July 7 at 20:45', style: kPostAuthor),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              title:
                  Text('Elena updated task description', style: kPostContent),
              subtitle: Text('2020 Aug 20 at 10:31', style: kPostAuthor),
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
              icon: Icon(Icons.link, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Link to item',
                    'link to a synapse, article, data project, nephron, flock, etc.');
              }),
        ],
      ),
    );
  }

  Widget _buildInputText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextFormField(
          autofocus: false,
          controller: _commentController,
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
              icon: Icon(Mdi.thumbUpOutline, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Like this task', 'Add a like');
              }),
          IconButton(
              icon: Icon(Icons.lock_outline, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Lock conversation', 'Lock the conversation');
              }),
          IconButton(
              icon: Icon(Icons.more_horiz, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('More options', 'Add Pin, Transfer, Delete');
              }),
          // IconButton(
          //     icon: Icon(Mdi.pinOutline, color: kIconActiveColor),
          //     onPressed: () {
          //       Get.snackbar('Pin issue', '3 issues can be pinned');
          //     }),
          // IconButton(
          //     icon: Icon(Icons.arrow_forward, color: kIconActiveColor),
          //     onPressed: () {
          //       Get.snackbar('Transfer issue', 'Transfer to different project');
          //     }),
          // IconButton(
          //     icon: Icon(Mdi.deleteOutline, color: kIconActiveColor),
          //     onPressed: () {
          //       Get.snackbar('Delete', 'Delete the issue');
          //     }),
          Spacer(),
          IconButton(
            icon: issue.isClosed
                ? Icon(Mdi.alertCircleCheckOutline, color: Colors.red)
                : Icon(Mdi.alertCircleOutline, color: Colors.green),
            onPressed: () {},
          ),
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
