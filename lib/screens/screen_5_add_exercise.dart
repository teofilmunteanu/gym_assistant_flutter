import 'package:flutter/material.dart';

class Screen5AddExercise extends StatefulWidget {
  const Screen5AddExercise({super.key});

  @override
  State<Screen5AddExercise> createState() => _Screen5AddExerciseState();
}

class _Screen5AddExerciseState extends State<Screen5AddExercise> {
  String? selectedMuscleGroup;
  
  final List<String> muscleGroups = [
    'Chest',
    'Back',
    'Shoulders',
    'Biceps',
    'Triceps',
    'Forearms',
    'Legs',
    'Quadriceps',
    'Hamstrings',
    'Glutes',
    'Calves',
    'Abs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
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

            const SizedBox(height: 20),

            const Text(
              'Add Exercise',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              
              child: Column(
                children: [
                  // Muscle group dropdown menu
                  DropdownButtonFormField<String>(
                    initialValue: selectedMuscleGroup,
                    hint: const Text('Select a muscle group'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Muscle Group',
                    ),
                    items: muscleGroups.map((String group) {
                      return DropdownMenuItem<String>(
                        value: group,
                        child: Text(group),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMuscleGroup = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a muscle group';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Exercise name input
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Exercise Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter exercise name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Exercise description input
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Exercise Description',
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter exercise description';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            
            // Save button whichs will add the exercise to the library
            ElevatedButton(
              onPressed: () {
                // Add exercise to library
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Save', style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                minimumSize: const Size(200, 50),
              ),

              child: const Text('Back to Library', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
