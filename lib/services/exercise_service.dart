import 'package:gym_assistant_flutter/models/exercise_model.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Service for managing exercises
/// Uses shared_preferences for persistence, easily replaceable with a real database
class ExerciseService {
  static final ExerciseService _instance = ExerciseService._internal();
  
  List<ExerciseModel> _exercises = [];
  bool _isInitialized = false;

  ExerciseService._internal();

  factory ExerciseService() {
    return _instance;
  }

  /// Initialize and load exercises from storage
  Future<void> init() async {
    if (_isInitialized) return;
    
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('exercises') ?? [];
    
    _exercises = stored.map((json) {
      final data = jsonDecode(json) as Map<String, dynamic>;
      return ExerciseModel(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        muscleCategoryId: data['muscleCategoryId'],
        muscleGroupId: data['muscleGroupId'],
        muscleSubgroupId: data['muscleSubgroupId'],
      );
    }).toList();
    
    _isInitialized = true;
  }

  /// Save an exercise to storage
  ExerciseModel saveExercise({
    required String name,
    required String description,
    required String muscleCategoryId,
    required String muscleGroupId,
    String? muscleSubgroupId,
  }) {
    const uuid = Uuid();
    final exercise = ExerciseModel(
      id: uuid.v4(),
      name: name,
      description: description,
      muscleCategoryId: muscleCategoryId,
      muscleGroupId: muscleGroupId,
      muscleSubgroupId: muscleSubgroupId,
    );

    _exercises.add(exercise);
    _persistToStorage();
    
    return exercise;
  }

  /// Persist exercises to shared preferences
  Future<void> _persistToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = _exercises.map((e) => jsonEncode({
      'id': e.id,
      'name': e.name,
      'description': e.description,
      'muscleCategoryId': e.muscleCategoryId,
      'muscleGroupId': e.muscleGroupId,
      'muscleSubgroupId': e.muscleSubgroupId,
    })).toList();
    
    await prefs.setStringList('exercises', jsonList);
  }

  /// Get all exercises
  List<ExerciseModel> getAllExercises() {
    return List.unmodifiable(_exercises);
  }

  /// Get exercises by muscle category
  List<ExerciseModel> getExercisesByCategory(String categoryId) {
    return _exercises.where((e) => e.muscleCategoryId == categoryId).toList();
  }

  /// Update an existing exercise
  Future<ExerciseModel> updateExercise({
    required String id,
    required String name,
    required String description,
    required String muscleCategoryId,
    required String muscleGroupId,
    String? muscleSubgroupId,
  }) async {
    final index = _exercises.indexWhere((e) => e.id == id);
    if (index == -1) throw Exception('Exercise not found');

    final updatedExercise = ExerciseModel(
      id: id,
      name: name,
      description: description,
      muscleCategoryId: muscleCategoryId,
      muscleGroupId: muscleGroupId,
      muscleSubgroupId: muscleSubgroupId,
    );

    _exercises[index] = updatedExercise;
    await _persistToStorage();
    
    return updatedExercise;
  }

  /// Delete an exercise
  Future<void> deleteExercise(String id) async {
    _exercises.removeWhere((e) => e.id == id);
    await _persistToStorage();
  }
}
