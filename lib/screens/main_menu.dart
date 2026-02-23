import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Assistant'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              'Gym Assistant',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40), // Spacer

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen1'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                minimumSize: const Size(200, 50),
              ),

              child: const Text('Exercise Library', style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 20), // Spacer

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen2'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                minimumSize: const Size(200, 50),
              ),

              child: const Text('Workout Templates', style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 20), // Spacer

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen3'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                minimumSize: const Size(200, 50),
              ),

              child: const Text('Workouts History', style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 20), // Spacer

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen4'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                minimumSize: const Size(200, 50),
              ),

              child: const Text('Settings', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
