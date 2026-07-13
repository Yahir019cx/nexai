import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/theme/colors.dart';

class NexCheckbox extends StatefulWidget {
  const NexCheckbox({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<NexCheckbox> createState() => _NexCheckboxState();
}

class _NexCheckboxState extends State<NexCheckbox> {
  static const double _size = 18;

  bool _isHovered = false;
  bool _isFocused = false;

  bool get _isDisabled => widget.onChanged == null;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    final borderColor = widget.value
        ? AppColors.primary
        : (_isHovered ? colors.borderStrong : colors.border);

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
            width: _size,
            height: _size,
            decoration: BoxDecoration(
              color: widget.value ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(AppRadius.radius8),
              border: Border.all(
                color: _isFocused ? AppColors.primary : borderColor,
                width: _isFocused ? 1.5 : 1.2,
              ),
            ),
            child: widget.value
                ? const Icon(Icons.check, size: 13, color: Colors.white)
                : null,
          ),
        ),
      ),
    );
  }
}
