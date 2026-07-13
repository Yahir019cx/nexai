import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';

/// Indicador de carga propio de NEXAI (doc 010/022 prohíben el
/// spinner tradicional). Tres puntos que laten de forma escalonada.
class NexLoading extends StatefulWidget {
  const NexLoading({super.key, this.size = 16, this.color});

  final double size;
  final Color? color;

  @override
  State<NexLoading> createState() => _NexLoadingState();
}

class _NexLoadingState extends State<NexLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dotColor =
        widget.color ?? Theme.of(context).extension<NexColors>()!.textPrimary;
    final dotSize = widget.size / 4;

    return SizedBox(
      width: widget.size,
      height: dotSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              final phase = (_controller.value + index / 3) % 1.0;
              final pulse = (math.sin(phase * 2 * math.pi) + 1) / 2;

              return Opacity(
                opacity: 0.35 + 0.65 * pulse,
                child: Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
