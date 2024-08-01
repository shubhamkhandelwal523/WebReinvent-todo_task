import 'package:flutter/material.dart';
import 'package:todolist/data/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todoModel;
  final VoidCallback onToggle;

  const TodoTile({
    super.key,
    required this.todoModel,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoModel.title),
      trailing: Checkbox(
        value: todoModel.isComplete,
        onChanged: (bool? value) => onToggle(),
      ),
    );
  }
}
