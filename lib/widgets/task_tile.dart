import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/task.dart';
import 'package:cortex_earth_3/services/database.dart';

class TaskTile extends StatelessWidget {
  final String uid;
  final TaskModel task;
  final Function onTap;
  final Function longPressCallback;
  final Function checkboxCallback;

  const TaskTile({
    Key key,
    this.uid,
    this.task,
    this.onTap,
    this.checkboxCallback,
    this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Row(
          children: [
            Checkbox(
                activeColor: Colors.lightBlue,
                value: task.isDone,
                onChanged: (newValue) {
                  Database().updateTaskisDone(newValue, uid, task.taskID);
                }),
            SizedBox(width: 5),
            Flexible(
              child: Text(
                task.content,
                style: TextStyle(
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ListTile(
//       onLongPress: longPressCallback,
//       onTap: onTap,
//       title: Text(
//         task.content,
//         style: TextStyle(
//             decoration: task.isDone ? TextDecoration.lineThrough : null),
//       ),
//       leading: Checkbox(
//           value: task.isDone,
//           onChanged: (newValue) {
//             Database().completeTask(newValue, uid, task.taskID);
//           }),
//     );
