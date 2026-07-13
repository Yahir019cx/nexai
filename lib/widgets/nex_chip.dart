import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

class NexChip extends StatefulWidget {
  const NexChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.onRemove,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  State<NexChip> createState() => _NexChipState();
}

class _NexChipState extends State<NexChip> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final isInteractive = widget.onTap != null;

    final background = widget.isSelected
        ? AppColors.primary.withValues(alpha: 0.18)
        : (isInteractive && _isHovered
              ? colors.surfaceHigh
              : colors.surfaceVariant);

    final foreground = widget.isSelected
        ? AppColors.primary
        : colors.textPrimary;

    final content = AnimatedContainer(
      duration: AppDurations.fast,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space12,
        vertical: AppSpacing.space4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.radius16),
        border: Border.all(
          color: widget.isSelected || _isFocused
              ? AppColors.primary
              : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              widget.label,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption.copyWith(
                color: foreground,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (widget.onRemove != null) ...[
            const SizedBox(width: AppSpacing.space4),
            GestureDetector(
              onTap: widget.onRemove,
              child: Icon(Icons.close, size: 12, color: foreground),
            ),
          ],
        ],
      ),
    );

    if (!isInteractive) return content;

    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (value) => setState(() => _isHovered = value),
      onShowFocusHighlight: (value) => setState(() => _isFocused = value),
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap!();
            return null;
          },
        ),
      },
      child: GestureDetector(onTap: widget.onTap, child: content),
    );
  }
}
