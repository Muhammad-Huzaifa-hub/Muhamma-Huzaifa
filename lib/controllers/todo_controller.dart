import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoController extends ChangeNotifier {
  List<TodoModel> todos = [];

  void addTodo(String title) {
    todos.add(TodoModel(title: title));
    notifyListeners();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void toggleTodo(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    notifyListeners();
  }
}