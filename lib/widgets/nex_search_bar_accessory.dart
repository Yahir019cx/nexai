import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

class NexSearchBarClearButton extends StatefulWidget {
  const NexSearchBarClearButton({
    super.key,
    required this.onTap,
    required this.colors,
  });

  final VoidCallback onTap;
  final NexColors colors;

  @override
  State<NexSearchBarClearButton> createState() =>
      _NexSearchBarClearButtonState();
}

class _NexSearchBarClearButtonState extends State<NexSearchBarClearButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Icon(
          Icons.close,
          size: 16,
          color: _isHovered
              ? widget.colors.textPrimary
              : widget.colors.textSecondary,
        ),
      ),
    );
  }
}

class NexSearchBarShortcutBadge extends StatelessWidget {
  const NexSearchBarShortcutBadge({
    super.key,
    required this.label,
    required this.colors,
  });

  final String label;
  final NexColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space8,
        vertical: AppSpacing.space4,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceHigh,
        borderRadius: BorderRadius.circular(AppRadius.radius8),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(color: colors.textDisabled),
      ),
    );
  }
}
