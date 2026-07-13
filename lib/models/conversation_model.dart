import 'package:nexai/models/message_model.dart';

class ConversationModel {
  const ConversationModel({
    required this.id,
    required this.title,
    required this.updatedAt,
    this.messages = const [],
    this.agentName,
    this.agentInstructions,
  });

  final String id;
  final String title;
  final DateTime updatedAt;
  final List<MessageModel> messages;

  /// Agente activo en esta conversación (doc013 Fase 7: "Ejecutar
  /// agente"). Nulo para conversaciones normales.
  final String? agentName;
  final String? agentInstructions;

  ConversationModel copyWith({
    String? title,
    DateTime? updatedAt,
    List<MessageModel>? messages,
  }) {
    return ConversationModel(
      id: id,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
      messages: messages ?? this.messages,
      agentName: agentName,
      agentInstructions: agentInstructions,
    );
  }
}
