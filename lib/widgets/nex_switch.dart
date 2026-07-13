import 'package:flutter/material.dart';
import 'package:nexai/core/constants/curves.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/theme/colors.dart';

class NexSwitch extends StatefulWidget {
  const NexSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<NexSwitch> createState() => _NexSwitchState();
}

class _NexSwitchState extends State<NexSwitch> {
  static const double _width = 40;
  static const double _height = 22;
  static const double _thumbSize = 16;

  bool _isHovered = false;
  bool _isFocused = false;

  bool get _isDisabled => widget.onChanged == null;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    final trackColor = widget.value
        ? AppColors.primary.withValues(alpha: _isHovered ? 1 : 0.9)
        : (_isHovered ? colors.surfaceHigh : colors.surfaceVariant);

    return Opacity(
      opacity: _isDisabled ? 0.5 : 1,
      child: FocusableActionDetector(
        enabled: !_isDisabled,
        mouseCursor: _isDisabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onShowHoverHighlight: (value) => setState(() => _isHovered = value),
        onShowFocusHighlight: (value) => setState(() => _isFocused = value),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onChanged?.call(!widget.value);
              return null;
            },
          ),
        },
        child: GestureDetector(
          onTap: _isDisabled ? null : () => widget.onChanged!(!widget.value),
          child: AnimatedContainer(
            duration: AppDurations.fast,
            width: _width,
            height: _height,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: trackColor,
              borderRadius: BorderRadius.circular(_height / 2),
              border: Border.all(
                color: _isFocused ? AppColors.primary : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: AnimatedAlign(
              duration: AppDurations.fast,
              curve: AppCurves.standard,
              alignment: widget.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: _thumbSize,
                height: _thumbSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
