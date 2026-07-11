import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF00B8C0);
  static const Color secondary = Color(0xFF009CA5);
  static const Color accent = Color(0xFF02ACB2);
  static const Color highlight = Color(0xFF00C0C7);
}

class NexColors extends ThemeExtension<NexColors> {
  const NexColors({
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.surfaceHigh,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.success,
    required this.error,
    required this.warning,
  });

  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color surfaceHigh;
  final Color border;
  final Color borderStrong;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color success;
  final Color error;
  final Color warning;

  static const NexColors dark = NexColors(
    background: Color(0xFF000000),
    surface: Color(0xFF101010),
    surfaceVariant: Color(0xFF181818),
    surfaceHigh: Color(0xFF202020),
    border: Color(0xFF2B2B2B),
    borderStrong: Color(0xFF3A3A3A),
    textPrimary: Color(0xFFF5F5F5),
    textSecondary: Color(0xFFA0A0A0),
    textDisabled: Color(0xFF5C5C5C),
    success: Color(0xFF34C77B),
    error: Color(0xFFE5484D),
    warning: Color(0xFFE5A73B),
  );

  static const NexColors light = NexColors(
    background: Color(0xFFFAFAFA),
    surface: Color(0xFFF2F2F2),
    surfaceVariant: Color(0xFFEAEAEA),
    surfaceHigh: Color(0xFFE0E0E0),
    border: Color(0xFFDDDDDD),
    borderStrong: Color(0xFFC7C7C7),
    textPrimary: Color(0xFF101010),
    textSecondary: Color(0xFF5C5C5C),
    textDisabled: Color(0xFFA0A0A0),
    success: Color(0xFF1E9E5A),
    error: Color(0xFFD93036),
    warning: Color(0xFFC97F1D),
  );

  @override
  NexColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? surfaceHigh,
    Color? border,
    Color? borderStrong,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? success,
    Color? error,
    Color? warning,
  }) {
    return NexColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      surfaceHigh: surfaceHigh ?? this.surfaceHigh,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
    );
  }

  @override
  NexColors lerp(ThemeExtension<NexColors>? other, double t) {
    if (other is! NexColors) return this;
    return NexColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      surfaceHigh: Color.lerp(surfaceHigh, other.surfaceHigh, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}
