import 'package:flutter/material.dart';
import 'package:nexai/features/chat/chat_service.dart';
import 'package:nexai/models/conversation_model.dart';
import 'package:nexai/models/message_model.dart';

class ChatController extends ChangeNotifier {
  ChatController({ChatService? chatService})
    : _chatService = chatService ?? ChatService();

  final ChatService _chatService;
  final List<ConversationModel> _conversations = [];
  String? _activeConversationId;
  bool _isSending = false;

  List<ConversationModel> get conversations => List.unmodifiable(_conversations);
  String? get activeConversationId => _activeConversationId;
  bool get isSending => _isSending;

  ConversationModel? get activeConversation {
    final id = _activeConversationId;
    if (id == null) return null;
    for (final conversation in _conversations) {
      if (conversation.id == id) return conversation;
    }
    return null;
  }

  void startNewConversation() {
    final conversation = ConversationModel(
      id: _generateId(),
      title: 'Nueva conversación',
      updatedAt: DateTime.now(),
    );
    _conversations.insert(0, conversation);
    _activeConversationId = conversation.id;
    notifyListeners();
  }

  void selectConversation(String id) {
    if (_activeConversationId == id) return;
    _activeConversationId = id;
    notifyListeners();
  }

  Future<void> sendMessage(String content) async {
    final trimmed = content.trim();
    if (trimmed.isEmpty || _isSending) return;

    if (activeConversation == null) startNewConversation();
    final conversationId = _activeConversationId!;
    final isFirstMessage = activeConversation!.messages.isEmpty;

    final userMessage = MessageModel(
      id: _generateId(),
      role: MessageRole.user,
      content: trimmed,
      createdAt: DateTime.now(),
    );
    _appendMessage(conversationId, userMessage);
    if (isFirstMessage) {
      _renameConversation(conversationId, _titleFrom(trimmed));
    }

    _isSending = true;
    notifyListeners();

    var assistantMessage = MessageModel(
      id: _generateId(),
      role: MessageRole.assistant,
      content: '',
      createdAt: DateTime.now(),
      status: MessageStatus.sending,
    );
    _appendMessage(conversationId, assistantMessage);

    await Future.delayed(const Duration(milliseconds: 700));

    assistantMessage = assistantMessage.copyWith(
      status: MessageStatus.streaming,
    );
    _replaceMessage(conversationId, assistantMessage);

    await for (final partial in _chatService.streamAssistantReply(trimmed)) {
      assistantMessage = assistantMessage.copyWith(content: partial);
      _replaceMessage(conversationId, assistantMessage);
    }

    assistantMessage = assistantMessage.copyWith(
      status: MessageStatus.complete,
    );
    _replaceMessage(conversationId, assistantMessage);

    _isSending = false;
    notifyListeners();
  }

  void _appendMessage(String conversationId, MessageModel message) {
    final conversation = _conversationById(conversationId);
    _updateConversation(
      conversation.copyWith(messages: [...conversation.messages, message]),
    );
  }

  void _replaceMessage(String conversationId, MessageModel message) {
    final conversation = _conversationById(conversationId);
    final messages = [
      for (final existing in conversation.messages)
        existing.id == message.id ? message : existing,
    ];
    _updateConversation(
      conversation.copyWith(messages: messages, updatedAt: DateTime.now()),
    );
  }

  void _renameConversation(String conversationId, String title) {
    _updateConversation(_conversationById(conversationId).copyWith(title: title));
  }

  ConversationModel _conversationById(String id) {
    return _conversations.firstWhere((conversation) => conversation.id == id);
  }

  void _updateConversation(ConversationModel updated) {
    final index = _conversations.indexWhere((c) => c.id == updated.id);
    _conversations[index] = updated;
    notifyListeners();
  }

  String _titleFrom(String content) {
    return content.length > 40 ? '${content.substring(0, 40)}…' : content;
  }

  String _generateId() =>
      '${DateTime.now().microsecondsSinceEpoch}-${_conversations.length}';
}
