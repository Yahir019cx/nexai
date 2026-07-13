import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/core/theme/theme_controller.dart';
import 'package:nexai/widgets/nex_switch.dart';
import 'package:provider/provider.dart';

class ThemeToggleRow extends StatelessWidget {
  const ThemeToggleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final colors = Theme.of(context).extension<NexColors>()!;
    final isDark = themeController.themeMode == ThemeMode.dark;

    return Row(
      children: [
        Expanded(
          child: Text(
            'Modo oscuro',
            style: AppTextStyles.body.copyWith(color: colors.textPrimary),
          ),
        ),
        NexSwitch(
          value: isDark,
          onChanged: (_) => themeController.toggleTheme(),
        ),
      ],
    );
  }
}
