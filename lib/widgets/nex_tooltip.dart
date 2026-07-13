import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_menu_entrance.dart';

/// Ayuda contextual con fade y pequeño retraso (doc 022/024).
/// Posicionada con CompositedTransformFollower (mismo patrón que
/// NexDropdown/NexContextMenu) para no depender de constraints
/// ambientales, a diferencia de un enfoque basado en OverflowBox.
class NexTooltip extends StatefulWidget {
  const NexTooltip({super.key, required this.message, required this.child});

  final String message;
  final Widget child;

  @override
  State<NexTooltip> createState() => _NexTooltipState();
}

class _NexTooltipState extends State<NexTooltip> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  Timer? _showTimer;

  void _scheduleShow() {
    _showTimer?.cancel();
    _showTimer = Timer(const Duration(milliseconds: 400), _show);
  }

  void _show() {
    if (!mounted || _overlayEntry != null) return;
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) =>
          _TooltipOverlay(layerLink: _layerLink, message: widget.message),
    );
    overlay.insert(_overlayEntry!);
  }

  void _hide() {
    _showTimer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => _scheduleShow(),
        onExit: (_) => _hide(),
        child: widget.child,
      ),
    );
  }
}

class _TooltipOverlay extends StatelessWidget {
  const _TooltipOverlay({required this.layerLink, required this.message});

  final LayerLink layerLink;
  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return IgnorePointer(
      child: CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        targetAnchor: Alignment.topCenter,
        followerAnchor: Alignment.bottomCenter,
        offset: const Offset(0, -AppSpacing.space8),
        child: NexMenuEntrance(
          child: _TooltipBubble(message: message, colors: colors),
        ),
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
