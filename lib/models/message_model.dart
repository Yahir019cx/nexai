import 'package:nexai/models/attachment_model.dart';

enum MessageRole { user, assistant }

enum MessageStatus { sending, streaming, complete, error, cancelled }

class MessageModel {
  const MessageModel({
    required this.id,
    required this.role,
    required this.content,
    required this.createdAt,
    this.status = MessageStatus.complete,
    this.modelId,
    this.attachments = const [],
  });

  final String id;
  final MessageRole role;
  final String content;
  final DateTime createdAt;
  final MessageStatus status;

  /// Modelo de IA que generó esta respuesta (doc 006: "la interfaz
  /// deberá mostrar claramente cuál modelo está respondiendo").
  /// Nulo para mensajes de usuario.
  final String? modelId;

  final List<AttachmentModel> attachments;

  MessageModel copyWith({String? content, MessageStatus? status}) {
    return MessageModel(
      id: id,
      role: role,
      content: content ?? this.content,
      createdAt: createdAt,
      status: status ?? this.status,
      modelId: modelId,
      attachments: attachments,
    );
  }
}
