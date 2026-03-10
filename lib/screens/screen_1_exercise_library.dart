import 'package:flutter/material.dart';
import 'package:gym_assistant_flutter/services/exercise_service.dart';
import 'package:gym_assistant_flutter/widgets/exercise_card.dart';

class Screen1ExerciseLibrary extends StatefulWidget {
  const Screen1ExerciseLibrary({super.key});

  @override
  State<Screen1ExerciseLibrary> createState() => _Screen1ExerciseLibraryState();
}

class _Screen1ExerciseLibraryState extends State<Screen1ExerciseLibrary> {
  final _exerciseService = ExerciseService();

  Future<void> _navigateToAddExercise() async {
    final result = await Navigator.pushNamed(context, '/screen5');
    if (result == true && mounted) {
      setState(() {});
    }
  }

  Future<void> _deleteExercise(String exerciseId) async {
    await _exerciseService.deleteExercise(exerciseId);
    if (mounted) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Exercise deleted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final exercises = _exerciseService.getAllExercises();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: exercises.isEmpty
          ? Center(
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
                    'Exercise Library',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No exercises yet. Add one to get started!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _navigateToAddExercise(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text('Add Exercise', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      return ExerciseCard(
                        exercise: exercises[index],
                        onDelete: () => _deleteExercise(exercises[index].id),
                        onEdit: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            '/screen5',
                            arguments: exercises[index].id,
                          );
                          if (result == true && mounted) {
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _navigateToAddExercise(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          minimumSize: const Size(200, 50),
                        ),
                        child: const Text('Add Exercise', style: TextStyle(fontSize: 18)),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Back to Menu'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
