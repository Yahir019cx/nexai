import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';

/// Área independiente dentro de una pantalla (panel derecho,
/// izquierdo, configuración, información — doc 022).
class NexPanel extends StatelessWidget {
  const NexPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.space16),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border),
      ),
      child: child,
    );
  }
}
