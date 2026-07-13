import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_card.dart';

/// Sección de la pantalla de Configuración: título + tarjeta con el
/// contenido (doc 013 Fase 4).
class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.label.copyWith(
            color: colors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.space12),
        NexCard(child: child),
      ],
    );
  }
}
