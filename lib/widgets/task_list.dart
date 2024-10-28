import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

/// Widget for displaying a scrollable list of tasks with delete functionality.
class TaskList extends StatelessWidget {
  final Box todoBox; // Reference to the Hive box for storing tasks
  final Function(int) onDelete; // Callback function for deleting tasks

  const TaskList({
    super.key,
    required this.todoBox,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: todoBox.listenable(), // Listens for changes in the Hive box
      builder: (context, Box box, _) {
        if (box.isEmpty) {
          // Displays a message if there are no tasks
          return const Center(child: Text('No tasks added yet.'));
        }
        // Builds a ListView for displaying tasks
        return ListView.builder(
          itemCount: box.length, // Sets the number of items
          itemBuilder: (context, index) {
            final task = box.getAt(index); // Retrieves task at the given index
            return ListTile(
              title: Text(task), // Displays the task text
              trailing: IconButton(
                icon: const Icon(Icons.delete), // Delete icon
                onPressed: () => onDelete(index), // Calls onDelete with task index
              ),
            );
          },
        );
      },
    );
  }
}
