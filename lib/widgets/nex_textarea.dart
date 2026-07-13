import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_field_style.dart';

class NexTextarea extends StatefulWidget {
  const NexTextarea({
    super.key,
    this.controller,
    this.label,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.minLines = 3,
    this.maxLines = 6,
    this.maxLength,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String? label;
  final String? errorText;
  final bool enabled;
  final bool readOnly;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  State<NexTextarea> createState() => _NexTextareaState();
}

class _NexTextareaState extends State<NexTextarea> {
  late final FocusNode _focusNode;
  bool _ownsFocusNode = false;
  bool _isHovered = false;
  bool _isFocused = false;
  int _length = 0;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _ownsFocusNode = widget.focusNode == null;
    _focusNode.addListener(_handleFocusChange);
    _length = widget.controller?.text.length ?? 0;
  }

  void _handleFocusChange() => setState(() => _isFocused = _focusNode.hasFocus);

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final hasError = widget.errorText != null;

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
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.caption.copyWith(
              color: hasError ? colors.error : colors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.space4),
        ],
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
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              onChanged: (value) {
                setState(() => _length = value.length);
                widget.onChanged?.call(value);
              },
              style: AppTextStyles.body.copyWith(color: colors.textPrimary),
              cursorColor: AppColors.primary,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                isCollapsed: true,
                counterText: '',
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.space4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (hasError)
              Expanded(
                child: Text(
                  widget.errorText!,
                  style: AppTextStyles.caption.copyWith(color: colors.error),
                ),
              )
            else
              const SizedBox.shrink(),
            if (widget.maxLength != null)
              Text(
                '$_length/${widget.maxLength}',
                style: AppTextStyles.caption.copyWith(
                  color: colors.textDisabled,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
