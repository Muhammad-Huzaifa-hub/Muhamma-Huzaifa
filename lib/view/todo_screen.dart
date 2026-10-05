import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/todo_controller.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController textController = TextEditingController();

  void showAddTodoDialog(BuildContext context) {
    textController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Task"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: "Enter task",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  Provider.of<TodoController>(
                    context,
                    listen: false,
                  ).addTodo(textController.text);

                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoController>(context).todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todo App"),
      ),

      body: todos.isEmpty
          ? const Center(
              child: Text("No tasks yet"),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todo: todos[index],
                  index: index,
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}