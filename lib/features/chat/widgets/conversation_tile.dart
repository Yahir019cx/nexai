import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

/// Fila de una conversación en el historial del Sidebar (doc 006).
class ConversationTile extends StatefulWidget {
  const ConversationTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<ConversationTile> createState() => _ConversationTileState();
}

class _ConversationTileState extends State<ConversationTile> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    final background = widget.isSelected
        ? colors.surfaceVariant
        : (_isHovered ? colors.surfaceHigh : Colors.transparent);
    final foreground = widget.isSelected
        ? colors.textPrimary
        : colors.textSecondary;

    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (value) => setState(() => _isHovered = value),
      onShowFocusHighlight: (value) => setState(() => _isFocused = value),
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space12,
            vertical: AppSpacing.space8,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(AppRadius.radius8),
            border: Border.all(
              color: _isFocused ? AppColors.primary : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body.copyWith(color: foreground),
          ),
        ),
      ),
    );
  }
}
