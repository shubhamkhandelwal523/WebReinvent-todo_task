import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/models/todo_model.dart';
import 'package:todolist/presentation/screen/provider/todo_provider.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return ListView.builder(
            itemCount: todoProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = todoProvider.tasks[index];
              return TodoTile(
                todoModel: task,
                onToggle: () => todoProvider.toggleTaskCompletion(index),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final TextEditingController controller = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Task'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    final title = controller.text;
                    if (title.isNotEmpty) {
                      Provider.of<TodoProvider>(context, listen: false)
                          .addTask(TodoModel(title: title));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
