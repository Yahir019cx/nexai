import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/settings/widgets/profile_settings_form.dart';
import 'package:nexai/features/settings/widgets/settings_section.dart';
import 'package:nexai/features/settings/widgets/theme_toggle_row.dart';

/// Pantalla de Configuración (doc 013 Fase 4): Perfil y Apariencia.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.space32),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración',
              style: AppTextStyles.headline.copyWith(
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.space32),
            const SettingsSection(
              title: 'Perfil',
              child: ProfileSettingsForm(),
            ),
            const SizedBox(height: AppSpacing.space24),
            const SettingsSection(
              title: 'Apariencia',
              child: ThemeToggleRow(),
            ),
          ],
        ),
      ),
    );
  }
}
