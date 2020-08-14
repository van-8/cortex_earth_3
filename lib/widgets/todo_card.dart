import 'package:flutter/material.dart';
import 'package:cortex_earth_3/models/todo.dart';
import 'package:cortex_earth_3/services/database.dart';

class TodoCard extends StatelessWidget {
  final String uid;
  final TodoModel todo;
  final Function onTap;

  const TodoCard({
    Key key,
    this.uid,
    this.todo,
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
                value: todo.done,
                onChanged: (newValue) {
                  Database().updateTodo(newValue, uid, todo.todoID);
                }),
            Expanded(
              child: Text(
                todo.content,
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
