import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';

/// Fondo ambiental sutil: NEXAI nunca debe sentirse completamente
/// estático (doc 0 / doc 016). Partículas lentas y discretas, sin
/// convertirse nunca en el centro de atención.
class LivingBackground extends StatefulWidget {
  const LivingBackground({super.key});

  @override
  State<LivingBackground> createState() => _LivingBackgroundState();
}

class _LivingBackgroundState extends State<LivingBackground>
    with SingleTickerProviderStateMixin {
  static const int _particleCount = 26;

  late final AnimationController _controller;
  late final List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 26),
    )..repeat();

    final random = math.Random(7);
    _particles = List.generate(_particleCount, (_) {
      return _Particle(
        baseX: random.nextDouble(),
        baseY: random.nextDouble(),
        driftRadius: 0.015 + random.nextDouble() * 0.02,
        phase: random.nextDouble() * 2 * math.pi,
        speed: 0.6 + random.nextDouble() * 0.6,
        radius: 1.2 + random.nextDouble() * 1.4,
        opacity: 0.12 + random.nextDouble() * 0.14,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size.infinite,
            painter: _LivingBackgroundPainter(
              particles: _particles,
              progress: _controller.value,
              dotColor: AppColors.primary,
              lineColor: colors.border,
            ),
          );
        },
      ),
    );
  }
}

class _Particle {
  const _Particle({
    required this.baseX,
    required this.baseY,
    required this.driftRadius,
    required this.phase,
    required this.speed,
    required this.radius,
    required this.opacity,
  });

  final double baseX;
  final double baseY;
  final double driftRadius;
  final double phase;
  final double speed;
  final double radius;
  final double opacity;
}

class _LivingBackgroundPainter extends CustomPainter {
  _LivingBackgroundPainter({
    required this.particles,
    required this.progress,
    required this.dotColor,
    required this.lineColor,
  });

  final List<_Particle> particles;
  final double progress;
  final Color dotColor;
  final Color lineColor;

  static const double _connectionDistance = 0.16;

  @override
  void paint(Canvas canvas, Size size) {
    final positions = particles.map((particle) {
      final angle =
          2 * math.pi * (progress * particle.speed + particle.phase);
      final dx = particle.baseX + particle.driftRadius * math.cos(angle);
      final dy = particle.baseY + particle.driftRadius * math.sin(angle);
      return Offset(dx * size.width, dy * size.height);
    }).toList();

    final linePaint = Paint()
      ..color = lineColor.withValues(alpha: 0.05)
      ..strokeWidth = 1;

    for (var i = 0; i < positions.length; i++) {
      for (var j = i + 1; j < positions.length; j++) {
        final distance =
            (positions[i] - positions[j]).distance / size.longestSide;
        if (distance < _connectionDistance) {
          canvas.drawLine(positions[i], positions[j], linePaint);
        }
      }
    }

    for (var i = 0; i < positions.length; i++) {
      final dotPaint = Paint()
        ..color = dotColor.withValues(alpha: particles[i].opacity);
      canvas.drawCircle(positions[i], particles[i].radius, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _LivingBackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
