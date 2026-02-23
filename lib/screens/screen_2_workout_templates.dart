import 'package:flutter/material.dart';

class Screen2WorkoutTemplates extends StatelessWidget {
  const Screen2WorkoutTemplates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Templates'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.trending_up,
              size: 80,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            const Text(
              'Workout Templates',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Manage your workout templates and routines',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40),

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
