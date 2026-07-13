import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/chat/widgets/message_markdown.dart';
import 'package:nexai/features/chat/widgets/thinking_indicator.dart';
import 'package:nexai/models/message_model.dart';
import 'package:nexai/widgets/nex_toast.dart';
import 'package:nexai/widgets/nex_tooltip.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({super.key, required this.message});

  final MessageModel message;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final isUser = widget.message.role == MessageRole.user;

    if (widget.message.status == MessageStatus.sending) {
      return const Align(
        alignment: Alignment.centerLeft,
        child: ThinkingIndicator(),
      );
    }

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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16,
                  vertical: AppSpacing.space12,
                ),
                decoration: BoxDecoration(
                  color: isUser
                      ? AppColors.primary.withValues(alpha: 0.15)
                      : colors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppRadius.radius16),
                ),
                child: isUser
                    ? Text(
                        widget.message.content,
                        style: AppTextStyles.body.copyWith(
                          color: colors.textPrimary,
                        ),
                      )
                    : MessageMarkdown(data: widget.message.content),
              ),
              AnimatedOpacity(
                opacity: _isHovered ? 1 : 0,
                duration: AppDurations.fast,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.space4),
                  child: _MessageActions(content: widget.message.content),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: AppDurations.normal).slideY(begin: 0.05, end: 0);
  }
}

class _MessageActions extends StatelessWidget {
  const _MessageActions({required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return NexTooltip(
      message: 'Copiar',
      child: GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: content));
          if (context.mounted) {
            NexToast.show(context, message: 'Copiado al portapapeles');
          }
        },
        child: Icon(Icons.copy_outlined, size: 14, color: colors.textDisabled),
      ),
    );
  }
}
