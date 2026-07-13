import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/chat/available_models.dart';
import 'package:nexai/features/chat/widgets/message_actions.dart';
import 'package:nexai/features/chat/widgets/message_markdown.dart';
import 'package:nexai/features/chat/widgets/thinking_indicator.dart';
import 'package:nexai/models/message_model.dart';
import 'package:nexai/widgets/nex_badge.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({
    super.key,
    required this.message,
    this.onEdit,
    this.onRegenerate,
  });

  final MessageModel message;
  final VoidCallback? onEdit;
  final VoidCallback? onRegenerate;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final message = widget.message;
    final isUser = message.role == MessageRole.user;
    final isError = message.status == MessageStatus.error;

    if (message.status == MessageStatus.sending) {
      return const Align(
        alignment: Alignment.centerLeft,
        child: ThinkingIndicator(),
      );
    }

    final model = message.modelId == null ? null : aiModelById(message.modelId!);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: isUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              if (model != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.space4),
                  child: NexBadge(label: model.name),
                ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16,
                  vertical: AppSpacing.space12,
                ),
                decoration: BoxDecoration(
                  color: isError
                      ? colors.error.withValues(alpha: 0.12)
                      : (isUser
                            ? AppColors.primary.withValues(alpha: 0.15)
                            : colors.surfaceVariant),
                  borderRadius: BorderRadius.circular(AppRadius.radius16),
                  border: isError
                      ? Border.all(color: colors.error.withValues(alpha: 0.4))
                      : null,
                ),
                child: isError
                    ? _ErrorContent(message: message.content, colors: colors)
                    : (isUser
                          ? Text(
                              message.content,
                              style: AppTextStyles.body.copyWith(
                                color: colors.textPrimary,
                              ),
                            )
                          : MessageMarkdown(data: message.content)),
              ),
              if (message.status == MessageStatus.cancelled)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.space4),
                  child: Text(
                    'Cancelado',
                    style: AppTextStyles.caption.copyWith(
                      color: colors.textDisabled,
                    ),
                  ),
                ),
              AnimatedOpacity(
                opacity: _isHovered ? 1 : 0,
                duration: AppDurations.fast,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.space4),
                  child: MessageActions(
                    content: message.content,
                    onEdit: isUser ? widget.onEdit : null,
                    onRegenerate: !isUser ? widget.onRegenerate : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: AppDurations.normal).slideY(begin: 0.05, end: 0);
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent({required this.message, required this.colors});

  final String message;
  final NexColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 16, color: colors.error),
        const SizedBox(width: AppSpacing.space8),
        Flexible(
          child: Text(
            message,
            style: AppTextStyles.body.copyWith(color: colors.error),
          ),
        ),
      ],
    );
  }
}
