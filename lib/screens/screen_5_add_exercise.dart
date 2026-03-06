import 'package:flutter/material.dart';
import 'package:gym_assistant_flutter/models/muscle_model.dart';
import 'package:gym_assistant_flutter/services/muscle_service.dart';

class Screen5AddExercise extends StatefulWidget {
  const Screen5AddExercise({super.key});

  @override
  State<Screen5AddExercise> createState() => _Screen5AddExerciseState();
}

class _Screen5AddExerciseState extends State<Screen5AddExercise> {
  String? selectedMuscleCategory;
  String? selectedMuscleGroup;
  String? selectedMuscleSubgroup;
  
  final List<MuscleNode> muscleCategories = MuscleService().getCategories();

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
                  // Muscle category dropdown menu
                  DropdownButtonFormField<String>(
                    initialValue: selectedMuscleCategory,
                    hint: const Text('Select a muscle category'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Muscle Category',
                    ),
                    items: muscleCategories.map((MuscleNode node) {
                      return DropdownMenuItem<String>(
                        value: node.id,
                        child: Text(node.name),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMuscleCategory = newValue;
                        selectedMuscleGroup = null;
                        selectedMuscleSubgroup = null;
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

                  // Muscle group dropdown (only visible if category selected)
                  if (selectedMuscleCategory != null)
                    DropdownButtonFormField<String>(
                      initialValue: selectedMuscleGroup,
                      hint: const Text('Select a muscle group'),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Muscle Group',
                      ),
                      items: MuscleService()
                          .getGroupsForCategory(selectedMuscleCategory!)
                          .map((MuscleNode node) {
                        return DropdownMenuItem<String>(
                          value: node.id,
                          child: Text(node.name),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMuscleGroup = newValue;
                          selectedMuscleSubgroup = null;
                        });
                      },
                    ),

                  if (selectedMuscleCategory != null) const SizedBox(height: 20),

                  // Muscle subgroup dropdown (only visible if group selected and has children)
                  if (selectedMuscleCategory != null && 
                      selectedMuscleGroup != null &&
                      MuscleService().getChildrenForNode(selectedMuscleCategory!, selectedMuscleGroup!).isNotEmpty)
                    DropdownButtonFormField<String>(
                      initialValue: selectedMuscleSubgroup,
                      hint: const Text('Select a muscle subgroup'),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Muscle Subgroup',
                      ),
                      items: MuscleService()
                          .getChildrenForNode(selectedMuscleCategory!, selectedMuscleGroup!)
                          .map((MuscleNode node) {
                        return DropdownMenuItem<String>(
                          value: node.id,
                          child: Text(node.name),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMuscleSubgroup = newValue;
                        });
                      },
                    ),

                  if (selectedMuscleCategory != null && selectedMuscleGroup != null && MuscleService().getChildrenForNode(selectedMuscleCategory!, selectedMuscleGroup!).isNotEmpty) const SizedBox(height: 20),

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
