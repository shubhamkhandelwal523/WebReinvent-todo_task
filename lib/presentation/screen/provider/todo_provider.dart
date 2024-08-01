import 'package:flutter/material.dart';
import 'package:todolist/data/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _tasks = [];

  List<TodoModel> get tasks => _tasks;

  void addTask(TodoModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isComplete = !_tasks[index].isComplete;
    notifyListeners();
  }
}
