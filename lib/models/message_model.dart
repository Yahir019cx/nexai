enum MessageRole { user, assistant }

enum MessageStatus { sending, streaming, complete, error, cancelled }

class MessageModel {
  const MessageModel({
    required this.id,
    required this.role,
    required this.content,
    required this.createdAt,
    this.status = MessageStatus.complete,
  });

  final String id;
  final MessageRole role;
  final String content;
  final DateTime createdAt;
  final MessageStatus status;

  MessageModel copyWith({String? content, MessageStatus? status}) {
    return MessageModel(
      id: id,
      role: role,
      content: content ?? this.content,
      createdAt: createdAt,
      status: status ?? this.status,
    );
  }
}
