import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';

/// Separador sutil. Nunca protagonista (doc 022).
class NexDivider extends StatelessWidget {
  const NexDivider({super.key, this.axis = Axis.horizontal});

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return axis == Axis.vertical
        ? Container(width: 1, color: colors.border)
        : Container(height: 1, color: colors.border);
  }
}
