import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/curves.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/utils/breakpoints.dart';

/// Contenido temporal reutilizable (doc 022). En Desktop/Tablet se
/// centra como tarjeta; en Mobile se comporta como bottom sheet
/// (doc 008), sin usar los widgets por defecto de Flutter.
Future<T?> showNexModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  final isMobile = Breakpoints.isMobile(MediaQuery.sizeOf(context).width);

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'modal',
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: AppDurations.normal,
    pageBuilder: (context, animation, secondaryAnimation) {
      return _NexModalContent(isMobile: isMobile, builder: builder);
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: AppCurves.standard,
      );
      if (isMobile) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        );
      }
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

class _NexModalContent extends StatelessWidget {
  const _NexModalContent({required this.isMobile, required this.builder});

  final bool isMobile;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    final card = Container(
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 480),
      width: isMobile ? double.infinity : null,
      padding: const EdgeInsets.all(AppSpacing.space24),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: isMobile
            ? const BorderRadius.vertical(top: Radius.circular(AppRadius.radius20))
            : BorderRadius.circular(AppRadius.radius20),
        border: Border.all(color: colors.border),
      ),
      child: builder(context),
    );

    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: const SizedBox.expand(),
          ),
        ),
        Align(
          alignment: isMobile ? Alignment.bottomCenter : Alignment.center,
          child: SafeArea(top: false, child: card),
        ),
      ],
    );
  }
}
