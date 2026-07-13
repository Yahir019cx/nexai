import 'package:flutter/material.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/features/chat/widgets/model_selector.dart';
import 'package:provider/provider.dart';

/// Encabezado del chat (doc 001: ChatPage se ensambla a partir de
/// ChatHeader, ChatBody, PromptInput). Muestra el título de la
/// conversación activa y el selector de modelo.
class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = context.watch<ChatController>();
    final colors = Theme.of(context).extension<NexColors>()!;
    final title = chatController.activeConversation?.title ?? 'NEXAI';

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.space24,
        AppSpacing.space16,
        AppSpacing.space24,
        AppSpacing.space8,
      ),
      child: Row(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: AppDurations.normal,
              child: Text(
                title,
                key: ValueKey(title),
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.title.copyWith(color: colors.textPrimary),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.space12),
          const ModelSelector(),
        ],
      ),
    );
  }
}
