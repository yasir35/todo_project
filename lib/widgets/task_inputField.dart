import 'package:flutter/material.dart';

/// Widget for displaying the input field and add button for adding new tasks.
class TaskInputField extends StatelessWidget {
  final TextEditingController controller; // Controller for managing input
  final VoidCallback onAdd; // Callback function triggered on add button press

  const TaskInputField({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TextField to enter new tasks
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter a new task'), // Hint text for input
          ),
        ),
        // IconButton to add the entered task
        IconButton(
          icon: const Icon(Icons.add), // Add icon
          onPressed: onAdd, // Calls onAdd function
        ),
      ],
    );
  }
}
