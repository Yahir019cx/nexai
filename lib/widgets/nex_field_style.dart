import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';

/// Color de borde compartido por NexInput y NexTextarea, para no
/// duplicar la resolución de estados (Normal/Hover/Focus/Error/
/// Disabled) entre ambos.
Color resolveNexFieldBorderColor({
  required NexColors colors,
  required bool isEnabled,
  required bool hasError,
  required bool isFocused,
  required bool isHovered,
}) {
  if (!isEnabled) return colors.border;
  if (hasError) return colors.error;
  if (isFocused) return AppColors.primary;
  if (isHovered) return colors.borderStrong;
  return colors.border;
}
