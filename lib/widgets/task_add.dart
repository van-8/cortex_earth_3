import 'package:cortex_earth_3/controllers/authController.dart';
// import 'package:cortex_earth_3/models/task.dart';
import 'package:cortex_earth_3/services/database.dart';
import 'package:cortex_earth_3/widgets/icon_gradient.dart';
// import 'package:cortex_earth_3/widgets/speech2text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../constants.dart';

class TaskAddScreen extends GetWidget<AuthController> {
  final TextEditingController _taskController = TextEditingController();
  // final TextEditingController _todoDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInput(),
            _buildBasic(),
            _buildTaskActionBar(),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 4, 14, 0),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  autofocus: true,
                  controller: _taskController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Task name...', border: InputBorder.none))),
          IconButton(
            icon: GradientIcon(Icons.mic, 24, kGradientGreenBlue),
            onPressed: () {
              Get.defaultDialog(
                  title: 'Task Dictation',
                  content: Text('yeah now whatever'),
                  textCancel: 'Cancel',
                  textConfirm: 'Confirm',
                  confirmTextColor: Colors.white);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBasic() {
    return Material(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width / 2,
              child: Row(
                children: [
                  IconButton(
                    icon:
                        Icon(Mdi.accountCircleOutline, color: kIconActiveColor),
                    onPressed: () {
                      Get.snackbar('Assignee pressed', 'ype ype');
                    },
                  ),
                  Text('Assigned to...'),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width / 2,
              child: Row(
                children: [
                  IconButton(
                    icon:
                        Icon(Mdi.calendarBlankOutline, color: kIconActiveColor),
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
      ),
    );
  }

  Widget _buildTaskActionBar() {
    return Material(
      child: Container(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Mdi.calendarBlankOutline, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('DueDate pressed', 'ype ype');
              },
            ),
            IconButton(
              icon: Icon(Mdi.alertDecagramOutline, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Priority pressed', ' ype');
              },
            ),
            IconButton(
              icon: Icon(Mdi.accountMultiple, color: kIconActiveColor),
              onPressed: () {
                Get.snackbar('Project pressed', ' ype');
              },
            ),
            Spacer(),
            FlatButton(
              child: Text(
                'Create',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () {
                if (_taskController.text != '') {
                  Database().addTask(
                    controller.user.uid,
                    _taskController.text,
                  );
                  _taskController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class _PriorityButton extends StatefulWidget {
//   @override
//   __PriorityButtonState createState() => __PriorityButtonState();
// }

// class __PriorityButtonState extends State<_PriorityButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: IconButton(
//         icon: Icon(Mdi.alertDecagramOutline, color: kIconActiveColor),
//         onPressed: () {
//           Get.snackbar('Priority pressed', ' ype');
//         },
//       ),
//     );
//   }
// }
