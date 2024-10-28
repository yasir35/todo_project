import 'package:flutter/material.dart';
import 'package:todo_project/screens/todo_list_screen.dart';
import 'package:todo_project/services/hive_services.dart';

/// The main function, which serves as the entry point for the Flutter application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initializeHive(); // Initialize Hive with service
  
  // Run the Flutter application
  runApp(const MyApp());
}

/// The main application widget, which sets up the app theme and home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,
      title: 'Todo APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        // Enable Material Design 3 for updated UI elements
        useMaterial3: true,
      ),
      
      // Set the home screen to the TodoListScreen widget
      home: const TodoListScreen(),
    );
  }
}
