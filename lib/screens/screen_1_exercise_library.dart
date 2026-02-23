import 'package:flutter/material.dart';

class Screen1ExerciseLibrary extends StatelessWidget {
  const Screen1ExerciseLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.library_books,
              size: 80,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20), // Spacer

            const Text(
              'Exercise Library',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20), // Spacer

            const Text(
              'Manage your exercise library and categories',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40), // Spacer

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
