import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/curves.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

enum NexToastType { success, error, warning, info }

/// Información temporal y flotante que nunca bloquea el flujo del
/// usuario (doc 010). No usa SnackBar (prohibido en doc 999): se
/// inserta directamente en el Overlay más cercano.
class NexToast extends StatelessWidget {
  const NexToast({super.key, required this.message, this.type = NexToastType.info});

  final String message;
  final NexToastType type;

  static void show(
    BuildContext context, {
    required String message,
    NexToastType type = NexToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => _NexToastOverlay(
        message: message,
        type: type,
        duration: duration,
        onDismissed: () => entry.remove(),
      ),
    );
    overlay.insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final (icon, color) = _iconAndColorFor(type, colors);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space12,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceHigh,
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: AppSpacing.space12),
          Flexible(
            child: Text(
              message,
              style: AppTextStyles.body.copyWith(color: colors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }

  (IconData, Color) _iconAndColorFor(NexToastType type, NexColors colors) {
    return switch (type) {
      NexToastType.success => (Icons.check_circle_outline, colors.success),
      NexToastType.error => (Icons.error_outline, colors.error),
      NexToastType.warning => (Icons.warning_amber_outlined, colors.warning),
      NexToastType.info => (Icons.info_outline, AppColors.primary),
    };
  }
}

class _NexToastOverlay extends StatefulWidget {
  const _NexToastOverlay({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismissed,
  });

  final String message;
  final NexToastType type;
  final Duration duration;
  final VoidCallback onDismissed;

  @override
  State<_NexToastOverlay> createState() => _NexToastOverlayState();
}

class _NexToastOverlayState extends State<_NexToastOverlay> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) setState(() => _isVisible = true);
    });
    Future.delayed(widget.duration, () async {
      if (!mounted) return;
      setState(() => _isVisible = false);
      await Future.delayed(AppDurations.normal);
      widget.onDismissed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSpacing.space32,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Center(
          child: AnimatedSlide(
            duration: AppDurations.normal,
            curve: AppCurves.standard,
            offset: _isVisible ? Offset.zero : const Offset(0, 0.3),
            child: AnimatedOpacity(
              duration: AppDurations.normal,
              opacity: _isVisible ? 1 : 0,
              child: NexToast(message: widget.message, type: widget.type),
            ),
          ),
        ),
      ),
    );
  }
}
