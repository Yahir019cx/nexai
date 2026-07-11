import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

abstract final class AppTheme {
  static ThemeData get dark => _build(NexColors.dark, Brightness.dark);

  static ThemeData get light => _build(NexColors.light, Brightness.light);

  static ThemeData _build(NexColors colors, Brightness brightness) {
    final onBrand = brightness == Brightness.dark
        ? Colors.black
        : Colors.white;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      canvasColor: colors.background,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: AppColors.primary,
        onPrimary: onBrand,
        secondary: AppColors.secondary,
        onSecondary: onBrand,
        error: colors.error,
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),
      textTheme: TextTheme(
        displayMedium: AppTextStyles.display.copyWith(
          color: colors.textPrimary,
        ),
        headlineMedium: AppTextStyles.headline.copyWith(
          color: colors.textPrimary,
        ),
        titleMedium: AppTextStyles.title.copyWith(color: colors.textPrimary),
        bodyMedium: AppTextStyles.body.copyWith(color: colors.textPrimary),
        labelMedium: AppTextStyles.label.copyWith(
          color: colors.textSecondary,
        ),
        bodySmall: AppTextStyles.caption.copyWith(
          color: colors.textSecondary,
        ),
      ),
      extensions: [colors],
    );
  }
}
