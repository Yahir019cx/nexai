import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

/// Ayuda contextual con fade y pequeño retraso (doc 022/024). No
/// utiliza Overlay: se dibuja por encima del contenido sin ocupar
/// espacio de layout, mediante OverflowBox.
class NexTooltip extends StatefulWidget {
  const NexTooltip({super.key, required this.message, required this.child});

  final String message;
  final Widget child;

  @override
  State<NexTooltip> createState() => _NexTooltipState();
}

class _NexTooltipState extends State<NexTooltip> {
  Timer? _showTimer;
  bool _isVisible = false;

  void _scheduleShow() {
    _showTimer?.cancel();
    _showTimer = Timer(const Duration(milliseconds: 400), () {
      if (mounted) setState(() => _isVisible = true);
    });
  }

  void _hide() {
    _showTimer?.cancel();
    if (_isVisible) setState(() => _isVisible = false);
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return MouseRegion(
      onEnter: (_) => _scheduleShow(),
      onExit: (_) => _hide(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 0,
            child: OverflowBox(
              maxHeight: 120,
              alignment: Alignment.bottomCenter,
              child: IgnorePointer(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.space8),
                  child: AnimatedOpacity(
                    opacity: _isVisible ? 1 : 0,
                    duration: AppDurations.fast,
                    child: _TooltipBubble(
                      message: widget.message,
                      colors: colors,
                    ),
                  ),
                ),
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}

class _TooltipBubble extends StatelessWidget {
  const _TooltipBubble({required this.message, required this.colors});

  final String message;
  final NexColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 220),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space12,
            vertical: AppSpacing.space8,
          ),
          decoration: BoxDecoration(
            color: colors.surfaceHigh,
            borderRadius: BorderRadius.circular(AppRadius.radius8),
            border: Border.all(color: colors.border),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(color: colors.textPrimary),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -1),
          child: Transform.rotate(
            angle: 0.785398,
            child: Container(width: 8, height: 8, color: colors.surfaceHigh),
          ),
        ),
      ],
    );
  }
}
