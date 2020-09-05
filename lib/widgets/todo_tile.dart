import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/todo.dart';
import 'package:cortex_earth_3/services/database.dart';

class TodoTile extends StatelessWidget {
  final String uid;
  final TodoModel todo;
  final Function onTap;
  final Function longPressCallback;
  final Function checkboxCallback;

  const TodoTile({
    Key key,
    this.uid,
    this.todo,
    this.onTap,
    this.checkboxCallback,
    this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      onTap: onTap,
      title: Text(
        todo.content,
        style: TextStyle(
            decoration: todo.done ? TextDecoration.lineThrough : null),
      ),
      leading: Checkbox(
          value: todo.done,
          onChanged: (newValue) {
            Database().completeTask(newValue, uid, todo.todoID);
          }),
    );
  }
}
