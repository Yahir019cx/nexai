import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/curves.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_button.dart';

class NexDialogAction {
  const NexDialogAction({
    required this.label,
    required this.onPressed,
    this.variant = NexButtonVariant.secondary,
  });

  final String label;
  final VoidCallback onPressed;
  final NexButtonVariant variant;
}

/// Diálogo para confirmaciones o información importante (doc 022).
/// Nunca usa AlertDialog por defecto (prohibido en doc 999).
Future<T?> showNexDialog<T>({
  required BuildContext context,
  required String title,
  String? message,
  required List<NexDialogAction> actions,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: title,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: AppDurations.normal,
    pageBuilder: (context, animation, secondaryAnimation) {
      return _NexDialogContent(title: title, message: message, actions: actions);
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: AppCurves.standard);
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class _NexDialogContent extends StatelessWidget {
  const _NexDialogContent({
    required this.title,
    required this.message,
    required this.actions,
  });

  final String title;
  final String? message;
  final List<NexDialogAction> actions;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: const SizedBox.expand(),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              margin: const EdgeInsets.all(AppSpacing.space24),
              padding: const EdgeInsets.all(AppSpacing.space24),
              decoration: BoxDecoration(
                color: colors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppRadius.radius20),
                border: Border.all(color: colors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.title.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                  if (message != null) ...[
                    const SizedBox(height: AppSpacing.space12),
                    Text(
                      message!,
                      style: AppTextStyles.body.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.space24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (var i = 0; i < actions.length; i++) ...[
                        if (i > 0) const SizedBox(width: AppSpacing.space12),
                        NexButton(
                          label: actions[i].label,
                          onPressed: actions[i].onPressed,
                          variant: actions[i].variant,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
