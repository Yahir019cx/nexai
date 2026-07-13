import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/features/chat/widgets/chat_welcome.dart';
import 'package:nexai/features/chat/widgets/message_list.dart';
import 'package:nexai/features/chat/widgets/prompt_input.dart';
import 'package:nexai/models/message_model.dart';
import 'package:provider/provider.dart';

/// Pantalla principal de NEXAI. Únicamente ensambla componentes
/// (doc 005): la lista de mensajes o el estado de bienvenida, y el
/// prompt fijo en la parte inferior.
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  static const double _maxContentWidth = 760;

  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _handleEdit(ChatController chatController, MessageModel message) {
    final content = chatController.prepareEdit(message.id);
    _promptController.value = TextEditingValue(
      text: content,
      selection: TextSelection.collapsed(offset: content.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatController = context.watch<ChatController>();
    final conversation = chatController.activeConversation;
    final hasMessages = conversation != null && conversation.messages.isNotEmpty;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _maxContentWidth),
              child: hasMessages
                  ? MessageList(
                      messages: conversation.messages,
                      onEdit: (message) =>
                          _handleEdit(chatController, message),
                      onRegenerate: chatController.isSending
                          ? null
                          : chatController.regenerateMessage,
                    )
                  : ChatWelcome(onSuggestionSelected: chatController.sendMessage),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.space24,
            0,
            AppSpacing.space24,
            AppSpacing.space24,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _maxContentWidth),
              child: PromptInput(
                controller: _promptController,
                isSending: chatController.isSending,
                onSend: chatController.sendMessage,
                onStop: chatController.cancelSending,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
