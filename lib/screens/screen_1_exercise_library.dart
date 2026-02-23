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

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen5'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                minimumSize: const Size(200, 50),
              ),

              child: const Text('Add Exercise', style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 40), // Spacer

            // This ElevatedButton is used to navigate back to the main menu.
            // When the button is pressed, this removes the top-most route from the navigator 
            // stack that most recently pushed the given route.
            // In this case, it will remove the current route (the exercise library screen) and go back to the main menu.
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
