class AgentModel {
  const AgentModel({
    required this.id,
    required this.name,
    required this.description,
    required this.instructions,
  });

  final String id;
  final String name;
  final String description;
  final String instructions;

  AgentModel copyWith({
    String? name,
    String? description,
    String? instructions,
  }) {
    return AgentModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
    );
  }
}
