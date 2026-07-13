import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_field_style.dart';

class NexSearchBar extends StatefulWidget {
  const NexSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Buscar',
    this.shortcutLabel,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? shortcutLabel;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  State<NexSearchBar> createState() => _NexSearchBarState();
}

class _NexSearchBarState extends State<NexSearchBar> {
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  bool _ownsFocusNode = false;
  bool _ownsController = false;
  bool _isHovered = false;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _ownsFocusNode = widget.focusNode == null;
    _focusNode.addListener(_handleFocusChange);

    _controller = widget.controller ?? TextEditingController();
    _ownsController = widget.controller == null;
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_handleTextChange);
  }

  void _handleFocusChange() => setState(() => _isFocused = _focusNode.hasFocus);

  void _handleTextChange() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) setState(() => _hasText = hasText);
  }

  void _clear() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _controller.removeListener(_handleTextChange);
    if (_ownsFocusNode) _focusNode.dispose();
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final borderColor = resolveNexFieldBorderColor(
      colors: colors,
      isEnabled: true,
      hasError: false,
      isFocused: _isFocused,
      isHovered: _isHovered,
    );
    final showShortcut =
        widget.shortcutLabel != null && !_isFocused && !_hasText;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppDurations.fast,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space12,
          vertical: AppSpacing.space8,
        ),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.radius12),
          border: Border.all(color: borderColor, width: _isFocused ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Icon(Icons.search, size: 18, color: colors.textSecondary),
            const SizedBox(width: AppSpacing.space8),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                onChanged: widget.onChanged,
                style: AppTextStyles.body.copyWith(color: colors.textPrimary),
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  isCollapsed: true,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.body.copyWith(
                    color: colors.textDisabled,
                  ),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: AppDurations.fast,
              child: _hasText
                  ? _ClearButton(
                      key: const ValueKey('clear'),
                      onTap: _clear,
                      colors: colors,
                    )
                  : (showShortcut
                        ? _ShortcutBadge(
                            key: const ValueKey('shortcut'),
                            label: widget.shortcutLabel!,
                            colors: colors,
                          )
                        : const SizedBox.shrink(key: ValueKey('empty'))),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClearButton extends StatefulWidget {
  const _ClearButton({super.key, required this.onTap, required this.colors});

  final VoidCallback onTap;
  final NexColors colors;

  @override
  State<_ClearButton> createState() => _ClearButtonState();
}

class _ClearButtonState extends State<_ClearButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Icon(
          Icons.close,
          size: 16,
          color: _isHovered
              ? widget.colors.textPrimary
              : widget.colors.textSecondary,
        ),
      ),
    );
  }
}

class _ShortcutBadge extends StatelessWidget {
  const _ShortcutBadge({
    super.key,
    required this.label,
    required this.colors,
  });

  final String label;
  final NexColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space8,
        vertical: AppSpacing.space4,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceHigh,
        borderRadius: BorderRadius.circular(AppRadius.radius8),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(color: colors.textDisabled),
      ),
    );
  }
}
