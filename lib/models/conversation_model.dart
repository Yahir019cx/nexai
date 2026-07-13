import 'package:nexai/models/message_model.dart';

class ConversationModel {
  const ConversationModel({
    required this.id,
    required this.title,
    required this.updatedAt,
    this.messages = const [],
  });

  final String id;
  final String title;
  final DateTime updatedAt;
  final List<MessageModel> messages;

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
    );
  }
}
