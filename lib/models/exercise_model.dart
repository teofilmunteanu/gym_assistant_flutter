class ExerciseModel {
  // Just the data model, no methods
  final String id;
  final String name;
  final String description;
  final String muscleCategoryId;
  final String muscleGroupId;
  final String? muscleSubgroupId;

  const ExerciseModel({
    required this.id,
    required this.name,
    this.description = "",
    required this.muscleCategoryId,
    required this.muscleGroupId,
    this.muscleSubgroupId
  });
}