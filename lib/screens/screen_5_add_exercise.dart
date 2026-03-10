import 'package:flutter/material.dart';
import 'package:gym_assistant_flutter/models/muscle_model.dart';
import 'package:gym_assistant_flutter/services/muscle_service.dart';
import 'package:gym_assistant_flutter/services/exercise_service.dart';

class Screen5AddExercise extends StatefulWidget {
  final String? exerciseId;

  const Screen5AddExercise({super.key, this.exerciseId});

  @override
  State<Screen5AddExercise> createState() => _Screen5AddExerciseState();
}

class _Screen5AddExerciseState extends State<Screen5AddExercise> {
  String? selectedMuscleCategory;
  String? selectedMuscleGroup;
  String? selectedMuscleSubgroup;
  
  late TextEditingController exerciseNameController;
  late TextEditingController exerciseDescriptionController;
  
  final List<MuscleNode> muscleCategories = MuscleService().getCategories();
  final _exerciseService = ExerciseService();

  @override
  void initState() {
    super.initState();
    exerciseNameController = TextEditingController();
    exerciseDescriptionController = TextEditingController();
    
    // If editing, load the exercise data
    if (widget.exerciseId != null) {
      _loadExerciseData();
    }
  }

  void _loadExerciseData() {
    final exercise = _exerciseService
        .getAllExercises()
        .firstWhere((e) => e.id == widget.exerciseId);
    
    exerciseNameController.text = exercise.name;
    exerciseDescriptionController.text = exercise.description;
    selectedMuscleCategory = exercise.muscleCategoryId;
    selectedMuscleGroup = exercise.muscleGroupId;
    selectedMuscleSubgroup = exercise.muscleSubgroupId;
    setState(() {});
  }

  @override
  void dispose() {
    exerciseNameController.dispose();
    exerciseDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseId != null ? 'Edit Exercise' : 'Add Exercise'),
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
                    controller: exerciseNameController,
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
                    controller: exerciseDescriptionController,
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
              onPressed: () => _saveExercise(),
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

  Future<void> _saveExercise() async {
    // Validate all required fields
    if (exerciseNameController.text.isEmpty) {
      _showError('Please enter an exercise name');
      return;
    }

    if (exerciseDescriptionController.text.isEmpty) {
      _showError('Please enter an exercise description');
      return;
    }

    if (selectedMuscleCategory == null) {
      _showError('Please select a muscle category');
      return;
    }

    if (selectedMuscleGroup == null) {
      _showError('Please select a muscle group');
      return;
    }

    // Save or update the exercise
    if (widget.exerciseId != null) {
      await _exerciseService.updateExercise(
        id: widget.exerciseId!,
        name: exerciseNameController.text,
        description: exerciseDescriptionController.text,
        muscleCategoryId: selectedMuscleCategory!,
        muscleGroupId: selectedMuscleGroup!,
        muscleSubgroupId: selectedMuscleSubgroup,
      );
    } else {
      _exerciseService.saveExercise(
        name: exerciseNameController.text,
        description: exerciseDescriptionController.text,
        muscleCategoryId: selectedMuscleCategory!,
        muscleGroupId: selectedMuscleGroup!,
        muscleSubgroupId: selectedMuscleSubgroup,
      );
    }

    // Show success message and navigate back
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.exerciseId != null
                ? 'Exercise updated successfully!'
                : 'Exercise saved successfully!',
          ),
        ),
      );
      Navigator.pop(context, true);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
