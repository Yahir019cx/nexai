import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_field_style.dart';

class NexInput extends StatefulWidget {
  const NexInput({
    super.key,
    this.controller,
    this.label,
    this.errorText,
    this.prefixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String? label;
  final String? errorText;
  final IconData? prefixIcon;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;

  @override
  State<NexInput> createState() => _NexInputState();
}

class _NexInputState extends State<NexInput> {
  late final FocusNode _focusNode;
  bool _ownsFocusNode = false;
  bool _isHovered = false;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _ownsFocusNode = widget.focusNode == null;
    _focusNode.addListener(_handleFocusChange);
    _hasText = widget.controller?.text.isNotEmpty ?? false;
    widget.controller?.addListener(_handleControllerChange);
  }

  void _handleFocusChange() => setState(() => _isFocused = _focusNode.hasFocus);

  void _handleControllerChange() {
    final hasText = widget.controller!.text.isNotEmpty;
    if (hasText != _hasText) setState(() => _hasText = hasText);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    widget.controller?.removeListener(_handleControllerChange);
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final hasError = widget.errorText != null;
    final showFloatingLabel = _isFocused || _hasText;

    final borderColor = resolveNexFieldBorderColor(
      colors: colors,
      isEnabled: widget.enabled,
      hasError: hasError,
      isFocused: _isFocused,
      isHovered: _isHovered,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: AppDurations.fast,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space16,
              vertical: AppSpacing.space12,
            ),
            decoration: BoxDecoration(
              color: widget.enabled ? colors.surface : colors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.radius12),
              border: Border.all(
                color: borderColor,
                width: _isFocused ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null) ...[
                  Icon(
                    widget.prefixIcon,
                    size: 18,
                    color: colors.textSecondary,
                  ),
                  const SizedBox(width: AppSpacing.space8),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSize(
                        duration: AppDurations.fast,
                        alignment: Alignment.topLeft,
                        child: widget.label != null && showFloatingLabel
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text(
                                  widget.label!,
                                  style: AppTextStyles.caption.copyWith(
                                    color: hasError
                                        ? colors.error
                                        : (_isFocused
                                              ? AppColors.primary
                                              : colors.textSecondary),
                                  ),
                                ),
                              )
                            : const SizedBox(width: double.infinity),
                      ),
                      TextField(
                        controller: widget.controller,
                        focusNode: _focusNode,
                        enabled: widget.enabled,
                        readOnly: widget.readOnly,
                        obscureText: widget.obscureText,
                        keyboardType: widget.keyboardType,
                        onChanged: (value) {
                          if (widget.controller == null) {
                            final hasText = value.isNotEmpty;
                            if (hasText != _hasText) {
                              setState(() => _hasText = hasText);
                            }
                          }
                          widget.onChanged?.call(value);
                        },
                        style: AppTextStyles.body.copyWith(
                          color: colors.textPrimary,
                        ),
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          isCollapsed: true,
                          hintText: showFloatingLabel ? null : widget.label,
                          hintStyle: AppTextStyles.body.copyWith(
                            color: colors.textDisabled,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: AppSpacing.space4),
          Text(
            widget.errorText!,
            style: AppTextStyles.caption.copyWith(color: colors.error),
          ),
        ],
      ],
    );
  }
}
