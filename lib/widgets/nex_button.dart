import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/widgets/nex_button_style.dart';
import 'package:nexai/widgets/nex_loading.dart';

export 'package:nexai/widgets/nex_button_style.dart'
    show NexButtonSize, NexButtonVariant;

class NexButton extends StatefulWidget {
  const NexButton({
    super.key,
    this.label,
    this.icon,
    required this.onPressed,
    this.variant = NexButtonVariant.primary,
    this.size = NexButtonSize.medium,
    this.isLoading = false,
  }) : assert(
         label != null || icon != null,
         'NexButton requiere al menos un label o un icon',
       );

  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final NexButtonVariant variant;
  final NexButtonSize size;
  final bool isLoading;

  bool get _isDisabled => onPressed == null || isLoading;
  bool get _isIconOnly => label == null;

  @override
  State<NexButton> createState() => _NexButtonState();
}

class _NexButtonState extends State<NexButton> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final background = nexButtonBackground(widget.variant, colors, _isHovered);
    final foreground = nexButtonForeground(widget.variant, colors);
    final borderColor = nexButtonBorderColor(widget.variant);
    final iconSize = nexButtonIconSize(widget.size);

    return Opacity(
      opacity: widget._isDisabled && !widget.isLoading ? 0.5 : 1,
      child: FocusableActionDetector(
        enabled: !widget._isDisabled,
        mouseCursor: widget._isDisabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onShowHoverHighlight: (value) => setState(() => _isHovered = value),
        onShowFocusHighlight: (value) => setState(() => _isFocused = value),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onPressed?.call();
              return null;
            },
          ),
        },
        child: GestureDetector(
          onTapDown: widget._isDisabled
              ? null
              : (_) => setState(() => _isPressed = true),
          onTapUp: widget._isDisabled
              ? null
              : (_) => setState(() => _isPressed = false),
          onTapCancel: widget._isDisabled
              ? null
              : () => setState(() => _isPressed = false),
          onTap: widget._isDisabled ? null : widget.onPressed,
          child: AnimatedScale(
            scale: _isPressed ? 0.97 : 1,
            duration: AppDurations.fast,
            child: AnimatedContainer(
              duration: AppDurations.fast,
              padding: nexButtonPadding(widget.size, widget._isIconOnly),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(AppRadius.radius12),
                border: Border.all(
                  color: _isFocused
                      ? AppColors.primary
                      : (borderColor ?? Colors.transparent),
                  width: _isFocused ? 1.5 : 1,
                ),
              ),
              child: widget.isLoading
                  ? NexLoading(size: iconSize, color: foreground)
                  : _NexButtonContent(
                      icon: widget.icon,
                      label: widget.label,
                      iconSize: iconSize,
                      foreground: foreground,
                      textStyle: nexButtonTextStyle(widget.size),
                      underline:
                          widget.variant == NexButtonVariant.text &&
                          _isHovered,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NexButtonContent extends StatelessWidget {
  const _NexButtonContent({
    required this.icon,
    required this.label,
    required this.iconSize,
    required this.foreground,
    required this.textStyle,
    required this.underline,
  });

  final IconData? icon;
  final String? label;
  final double iconSize;
  final Color foreground;
  final TextStyle textStyle;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) Icon(icon, size: iconSize, color: foreground),
        if (icon != null && label != null)
          const SizedBox(width: AppSpacing.space8),
        if (label != null)
          Text(
            label!,
            style: textStyle.copyWith(
              color: foreground,
              fontWeight: FontWeight.w600,
              decoration: underline
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
      ],
    );
  }
}
