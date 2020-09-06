import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/task.dart';
import 'package:cortex_earth_3/services/database.dart';

class TodoCard extends StatelessWidget {
  final String uid;
  final TaskModel task;
  final Function onTap;

  const TodoCard({
    Key key,
    this.uid,
    this.task,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Checkbox(
                value: task.isDone,
                onChanged: (newValue) {
                  Database().updateTaskisDone(newValue, uid, task.taskID);
                }),
            Expanded(
              child: Text(
                task.content,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
