import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_chip.dart';

/// Estado vacío del chat (doc 006): nunca una pantalla en blanco.
class ChatWelcome extends StatelessWidget {
  const ChatWelcome({super.key, required this.onSuggestionSelected});

  final ValueChanged<String> onSuggestionSelected;

  static const List<String> _suggestions = [
    '¿Qué puedes hacer por mí?',
    'Ayúdame a escribir un correo profesional',
    'Explica un concepto complejo de forma simple',
    'Genera ideas para un proyecto nuevo',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.space32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo/nexai_logo.png', width: 56, height: 56),
            const SizedBox(height: AppSpacing.space24),
            Text(
              '¿En qué trabajamos hoy?',
              style: AppTextStyles.headline.copyWith(
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
            Text(
              'Escribe un mensaje o elige una idea para empezar.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(color: colors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.space32),
            Wrap(
              spacing: AppSpacing.space12,
              runSpacing: AppSpacing.space12,
              alignment: WrapAlignment.center,
              children: [
                for (final suggestion in _suggestions)
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 260),
                    child: NexChip(
                      label: suggestion,
                      onTap: () => onSuggestionSelected(suggestion),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
