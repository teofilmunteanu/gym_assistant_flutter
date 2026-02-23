import 'package:flutter/material.dart';

class Screen3WorkoutsHistory extends StatelessWidget {
  const Screen3WorkoutsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts History'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.history,
              size: 80,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            const Text(
              'History',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'View your workout history and progress',
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
