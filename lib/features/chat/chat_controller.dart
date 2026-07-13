import 'package:flutter/material.dart';
import 'package:nexai/features/chat/available_models.dart';
import 'package:nexai/features/chat/chat_service.dart';
import 'package:nexai/models/attachment_model.dart';
import 'package:nexai/models/conversation_model.dart';
import 'package:nexai/models/message_model.dart';

class ChatController extends ChangeNotifier {
  ChatController({ChatService? chatService})
    : _chatService = chatService ?? ChatService();

  final ChatService _chatService;
  final List<ConversationModel> _conversations = [];
  String? _activeConversationId;
  String _selectedModelId = availableAiModels.first.id;
  bool _isSending = false;
  bool _cancelRequested = false;

  List<ConversationModel> get conversations => List.unmodifiable(_conversations);
  String? get activeConversationId => _activeConversationId;
  String get selectedModelId => _selectedModelId;
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

  /// Cambia el modelo activo (doc 013 Fase 5: "Cambio dinámico").
  void selectModel(String modelId) {
    if (_selectedModelId == modelId) return;
    _selectedModelId = modelId;
    notifyListeners();
  }

  Future<void> sendMessage(
    String content, {
    List<AttachmentModel> attachments = const [],
  }) async {
    final trimmed = content.trim();
    if ((trimmed.isEmpty && attachments.isEmpty) || _isSending) return;

    if (activeConversation == null) startNewConversation();
    final conversationId = _activeConversationId!;
    final isFirstMessage = activeConversation!.messages.isEmpty;

    final userMessage = MessageModel(
      id: _generateId(),
      role: MessageRole.user,
      content: trimmed,
      createdAt: DateTime.now(),
      attachments: attachments,
    );
    _appendMessage(conversationId, userMessage);
    if (isFirstMessage) {
      _renameConversation(
        conversationId,
        _titleFrom(trimmed.isEmpty ? attachments.first.fileName : trimmed),
      );
    }

    await _streamAssistantResponse(conversationId, trimmed);
  }

  /// Regenera una respuesta existente (doc 006: acción "Regenerar"),
  /// repitiendo el prompt del mensaje de usuario que la originó.
  Future<void> regenerateMessage(String messageId) async {
    final conversation = activeConversation;
    if (conversation == null || _isSending) return;

    final index = conversation.messages.indexWhere((m) => m.id == messageId);
    if (index <= 0) return;
    final precedingUserMessage = conversation.messages[index - 1];
    if (precedingUserMessage.role != MessageRole.user) return;

    _updateConversation(
      conversation.copyWith(messages: conversation.messages.sublist(0, index)),
    );
    await _streamAssistantResponse(conversation.id, precedingUserMessage.content);
  }

  /// Prepara la edición de un mensaje ya enviado (doc 006: "la
  /// conversación deberá continuar desde ese punto"): elimina ese
  /// mensaje y todo lo posterior, devolviendo su contenido original
  /// para que la pantalla lo cargue en el prompt.
  String prepareEdit(String messageId) {
    final conversation = activeConversation;
    if (conversation == null) return '';

    final index = conversation.messages.indexWhere((m) => m.id == messageId);
    if (index == -1) return '';

    final content = conversation.messages[index].content;
    _updateConversation(
      conversation.copyWith(messages: conversation.messages.sublist(0, index)),
    );
    return content;
  }

  /// Cancela la respuesta en curso (doc 006: estado "Cancelado").
  void cancelSending() {
    if (!_isSending) return;
    _cancelRequested = true;
  }

  Future<void> _streamAssistantResponse(
    String conversationId,
    String prompt,
  ) async {
    _isSending = true;
    _cancelRequested = false;
    final modelId = _selectedModelId;
    notifyListeners();

    var assistantMessage = MessageModel(
      id: _generateId(),
      role: MessageRole.assistant,
      content: '',
      createdAt: DateTime.now(),
      status: MessageStatus.sending,
      modelId: modelId,
    );
    _appendMessage(conversationId, assistantMessage);

    try {
      await Future.delayed(const Duration(milliseconds: 700));
      if (_cancelRequested) {
        _replaceMessage(
          conversationId,
          assistantMessage.copyWith(status: MessageStatus.cancelled),
        );
        return;
      }

      assistantMessage = assistantMessage.copyWith(
        status: MessageStatus.streaming,
      );
      _replaceMessage(conversationId, assistantMessage);

      await for (final partial in _chatService.streamAssistantReply(prompt)) {
        if (_cancelRequested) {
          _replaceMessage(
            conversationId,
            assistantMessage.copyWith(status: MessageStatus.cancelled),
          );
          return;
        }
        assistantMessage = assistantMessage.copyWith(content: partial);
        _replaceMessage(conversationId, assistantMessage);
      }

      assistantMessage = assistantMessage.copyWith(
        status: MessageStatus.complete,
      );
      _replaceMessage(conversationId, assistantMessage);
    } catch (_) {
      _replaceMessage(
        conversationId,
        assistantMessage.copyWith(
          status: MessageStatus.error,
          content: 'No fue posible completar la solicitud.',
        ),
      );
    } finally {
      _isSending = false;
      notifyListeners();
    }
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

  int _idCounter = 0;

  String _generateId() =>
      '${DateTime.now().microsecondsSinceEpoch}-${_idCounter++}';
}
