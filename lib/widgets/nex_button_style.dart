import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

enum NexButtonVariant { primary, secondary, ghost, outline, danger, icon, text }

enum NexButtonSize { small, medium, large }

/// Resolución de colores, tamaños y tipografía por variante/tamaño
/// de NexButton. Vive separado del widget para que este no crezca
/// más allá del límite de 200 líneas (doc 001).
Color nexButtonBackground(NexButtonVariant variant, NexColors colors, bool hover) {
  return switch (variant) {
    NexButtonVariant.primary => AppColors.primary.withValues(
      alpha: hover ? 1 : 0.9,
    ),
    NexButtonVariant.danger => colors.error.withValues(alpha: hover ? 1 : 0.9),
    NexButtonVariant.secondary => hover
        ? colors.surfaceHigh
        : colors.surfaceVariant,
    NexButtonVariant.ghost ||
    NexButtonVariant.icon ||
    NexButtonVariant.outline => hover ? colors.surfaceHigh : Colors.transparent,
    NexButtonVariant.text => Colors.transparent,
  };
}

Color nexButtonForeground(NexButtonVariant variant, NexColors colors) {
  return switch (variant) {
    NexButtonVariant.primary || NexButtonVariant.danger => Colors.white,
    NexButtonVariant.secondary ||
    NexButtonVariant.ghost ||
    NexButtonVariant.icon => colors.textPrimary,
    NexButtonVariant.outline || NexButtonVariant.text => AppColors.primary,
  };
}

Color? nexButtonBorderColor(NexButtonVariant variant) {
  return variant == NexButtonVariant.outline ? AppColors.primary : null;
}

EdgeInsets nexButtonPadding(NexButtonSize size, bool isIconOnly) {
  if (isIconOnly) {
    return switch (size) {
      NexButtonSize.small => const EdgeInsets.all(AppSpacing.space8),
      NexButtonSize.medium => const EdgeInsets.all(AppSpacing.space12),
      NexButtonSize.large => const EdgeInsets.all(AppSpacing.space16),
    };
  }
  return switch (size) {
    NexButtonSize.small => const EdgeInsets.symmetric(
      horizontal: AppSpacing.space12,
      vertical: AppSpacing.space8,
    ),
    NexButtonSize.medium => const EdgeInsets.symmetric(
      horizontal: AppSpacing.space16,
      vertical: AppSpacing.space12,
    ),
    NexButtonSize.large => const EdgeInsets.symmetric(
      horizontal: AppSpacing.space20,
      vertical: AppSpacing.space12,
    ),
  };
}

double nexButtonIconSize(NexButtonSize size) {
  return switch (size) {
    NexButtonSize.small => 16,
    NexButtonSize.medium => 18,
    NexButtonSize.large => 20,
  };
}

TextStyle nexButtonTextStyle(NexButtonSize size) {
  return switch (size) {
    NexButtonSize.small => AppTextStyles.caption,
    NexButtonSize.medium => AppTextStyles.label,
    NexButtonSize.large => AppTextStyles.body,
  };
}
