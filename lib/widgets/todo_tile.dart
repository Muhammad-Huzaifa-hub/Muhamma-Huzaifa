import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo_model.dart';
import '../controllers/todo_controller.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final int index;

  const TodoTile({
    super.key,
    required this.todo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          Provider.of<TodoController>(
            context,
            listen: false,
          ).toggleTodo(index);
        },
      ),

      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),

      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          Provider.of<TodoController>(
            context,
            listen: false,
          ).deleteTodo(index);
        },
      ),
    );
  }
}