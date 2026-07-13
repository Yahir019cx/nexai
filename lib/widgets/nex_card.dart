import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';

class NexCard extends StatefulWidget {
  const NexCard({
    super.key,
    required this.child,
    this.onTap,
    this.isSelected = false,
    this.padding = const EdgeInsets.all(AppSpacing.space16),
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool isSelected;
  final EdgeInsets padding;

  @override
  State<NexCard> createState() => _NexCardState();
}

class _NexCardState extends State<NexCard> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final isInteractive = widget.onTap != null;
    final isLifted = isInteractive && _isHovered;

    final background = widget.isSelected
        ? colors.surfaceVariant
        : (isLifted ? colors.surfaceHigh : colors.surface);

    final borderColor = widget.isSelected || _isFocused
        ? AppColors.primary
        : colors.border;

    final card = AnimatedContainer(
      duration: AppDurations.fast,
      padding: widget.padding,
      transform: Matrix4.translationValues(0, isLifted ? -2 : 0, 0),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.radius16),
        border: Border.all(
          color: borderColor,
          width: widget.isSelected || _isFocused ? 1.5 : 1,
        ),
        boxShadow: isLifted
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ]
            : const [],
      ),
      child: widget.child,
    );

    if (!isInteractive) return card;

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
      child: GestureDetector(onTap: widget.onTap, child: card),
    );
  }
}
