import 'package:flutter/material.dart';
import 'package:gym_assistant_flutter/models/exercise_model.dart';
import 'package:gym_assistant_flutter/models/muscle_model.dart';
import 'package:gym_assistant_flutter/services/muscle_service.dart';

/// A card widget that displays an exercise with expandable description
class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;
  final Future<void> Function()? onDelete;
  final VoidCallback? onEdit;

  const ExerciseCard({
    super.key,
    required this.exercise,
    this.onDelete,
    this.onEdit,
  });

  /// Get muscle category name by ID
  String? _getMuscleNameById(String? id, {required bool isCategory}) {
    if (id == null) return null;
    
    if (isCategory) {
      return MuscleService()
          .getCategories()
          .firstWhere(
            (node) => node.id == id,
            orElse: () => MuscleNode(id: '', name: 'Unknown'),
          )
          .name;
    }
    
    // For group or subgroup, search through all categories
    for (final category in MuscleService().getCategories()) {
      for (final node in MuscleService().getGroupsForCategory(category.id)) {
        if (node.id == id) {
          return node.name;
        }
      }
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = _getMuscleNameById(exercise.muscleCategoryId, isCategory: true);
    final groupName = _getMuscleNameById(exercise.muscleGroupId, isCategory: false);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (categoryName != null) ...[
                  Chip(
                    label: Text(categoryName),
                    visualDensity: VisualDensity.compact,
                  ),
                  const SizedBox(width: 8),
                ],
                if (groupName != null)
                  Chip(
                    label: Text(groupName),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (exercise.description.isNotEmpty) ...[
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exercise.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  children: [
                    if (onEdit != null)
                      ElevatedButton.icon(
                        onPressed: onEdit,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                    if (onDelete != null) const SizedBox(width: 8),
                    if (onDelete != null)
                      ElevatedButton.icon(
                        onPressed: onDelete != null ? () => onDelete!() : null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
