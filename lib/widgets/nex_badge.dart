import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

enum NexBadgeVariant { neutral, primary, success, error, warning }

class NexBadge extends StatelessWidget {
  const NexBadge({
    super.key,
    required this.label,
    this.variant = NexBadgeVariant.neutral,
  });

  final String label;
  final NexBadgeVariant variant;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final (background, foreground) = _colorsFor(variant, colors);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space8,
        vertical: AppSpacing.space4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.radius8),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  (Color, Color) _colorsFor(NexBadgeVariant variant, NexColors colors) {
    return switch (variant) {
      NexBadgeVariant.neutral => (colors.surfaceHigh, colors.textSecondary),
      NexBadgeVariant.primary => (
        AppColors.primary.withValues(alpha: 0.15),
        AppColors.primary,
      ),
      NexBadgeVariant.success => (
        colors.success.withValues(alpha: 0.15),
        colors.success,
      ),
      NexBadgeVariant.error => (
        colors.error.withValues(alpha: 0.15),
        colors.error,
      ),
      NexBadgeVariant.warning => (
        colors.warning.withValues(alpha: 0.15),
        colors.warning,
      ),
    };
  }
}
