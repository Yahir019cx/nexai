import 'package:flutter/material.dart';
import 'package:nexai/core/constants/curves.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/features/chat/widgets/message_bubble.dart';
import 'package:nexai/models/message_model.dart';

/// Lista de mensajes con scroll independiente (doc 007) que se
/// desplaza automáticamente al llegar contenido nuevo, sin mover la
/// pantalla de forma brusca (doc 006).
class MessageList extends StatefulWidget {
  const MessageList({
    super.key,
    required this.messages,
    this.onEdit,
    this.onRegenerate,
  });

  final List<MessageModel> messages;
  final ValueChanged<MessageModel>? onEdit;
  final ValueChanged<String>? onRegenerate;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToBottom());
  }

  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_hasNewContent(oldWidget)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _animateToBottom());
    }
  }

  bool _hasNewContent(MessageList oldWidget) {
    if (widget.messages.length != oldWidget.messages.length) return true;
    if (widget.messages.isEmpty) return false;
    return widget.messages.last.content != oldWidget.messages.last.content;
  }

  void _jumpToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  void _animateToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: AppDurations.normal,
      curve: AppCurves.standard,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space24,
        vertical: AppSpacing.space24,
      ),
      itemCount: widget.messages.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.space16),
      itemBuilder: (context, index) {
        final message = widget.messages[index];
        return MessageBubble(
          message: message,
          onEdit: widget.onEdit == null
              ? null
              : () => widget.onEdit!(message),
          onRegenerate: widget.onRegenerate == null
              ? null
              : () => widget.onRegenerate!(message.id),
        );
      },
    );
  }
}
