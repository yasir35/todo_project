import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_project/widgets/task_inputField.dart';
import 'package:todo_project/widgets/task_list.dart';

/// Main screen for displaying the Todo List UI and handling user interactions.
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final Box _todoBox = Hive.box('todoBox'); // Reference to the Hive box
  final TextEditingController _controller = TextEditingController(); // Controller for the input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')), // AppBar with a title
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field and add button for new tasks
            TaskInputField(
              controller: _controller,
              onAdd: _addTask,
            ),
            // Scrollable list of tasks with delete functionality
            Expanded(
              child: TaskList(
                todoBox: _todoBox,
                onDelete: _deleteTask,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Adds a new task to the Hive box and clears the input field.
  void _addTask() {
    final task = _controller.text.trim(); // Gets and trims user input
    if (task.isNotEmpty) {
      _todoBox.add(task); // Adds the task to Hive box
      _controller.clear(); // Clears the input field
    }
  }

  /// Deletes a task from the Hive box based on the provided index.
  void _deleteTask(int index) => _todoBox.deleteAt(index); // Removes the task by index
}
