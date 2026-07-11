import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexai/core/constants/durations.dart';

/// Transición compartida por todas las rutas de NEXAI: un fade suave,
/// nunca un corte brusco entre pantallas (doc 007).
Page<void> buildFadeTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: AppDurations.normal,
    reverseTransitionDuration: AppDurations.normal,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
