import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/features/chat/conversation_grouping.dart';
import 'package:nexai/features/chat/widgets/conversation_tile.dart';
import 'package:provider/provider.dart';

/// Historial de conversaciones del Sidebar, agrupado por fecha
/// (doc 006). Vive en features/chat porque depende del dominio del
/// chat; NexSidebar (widget global) solo lo consume.
class SidebarConversationHistory extends StatelessWidget {
  const SidebarConversationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = context.watch<ChatController>();
    final colors = Theme.of(context).extension<NexColors>()!;

    if (chatController.conversations.isEmpty) {
      return Center(
        child: Text(
          'Aún no tienes conversaciones',
          textAlign: TextAlign.center,
          style: AppTextStyles.caption.copyWith(color: colors.textDisabled),
        ),
      );
    }

    final groups = groupConversationsByDate(chatController.conversations);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        for (final entry in groups.entries) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space12,
              vertical: AppSpacing.space4,
            ),
            child: Text(
              entry.key,
              style: AppTextStyles.caption.copyWith(
                color: colors.textDisabled,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          for (final conversation in entry.value)
            ConversationTile(
              title: conversation.title,
              isSelected: conversation.id == chatController.activeConversationId,
              onTap: () => chatController.selectConversation(conversation.id),
            ),
          const SizedBox(height: AppSpacing.space8),
        ],
      ],
    );
  }
}
