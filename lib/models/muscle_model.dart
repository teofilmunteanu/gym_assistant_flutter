class MuscleNode {
  // Just the data model, no methods
  final String id;
  final String name;
  final Map<String, MuscleNode> children;

  const MuscleNode({
    required this.id,
    required this.name,
    this.children = const {},
  });
}