import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_dropdown_overlay.dart';

class NexDropdownItem<T> {
  const NexDropdownItem({required this.value, required this.label, this.icon});

  final T value;
  final String label;
  final IconData? icon;
}

class NexDropdown<T> extends StatefulWidget {
  const NexDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
  });

  final List<NexDropdownItem<T>> items;
  final T? value;
  final ValueChanged<T> onChanged;
  final String? hint;

  @override
  State<NexDropdown<T>> createState() => _NexDropdownState<T>();
}

class _NexDropdownState<T> extends State<NexDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  bool _isHovered = false;
  bool _isFocused = false;

  NexDropdownItem<T>? get _selected {
    for (final item in widget.items) {
      if (item.value == widget.value) return item;
    }
    return null;
  }

  void _toggle() => _isOpen ? _close() : _open();

  void _open() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject()! as RenderBox;

    _overlayEntry = OverlayEntry(
      builder: (context) => NexDropdownOverlay<T>(
        layerLink: _layerLink,
        width: renderBox.size.width,
        items: widget.items,
        selectedValue: widget.value,
        onSelected: (value) {
          widget.onChanged(value);
          _close();
        },
        onDismiss: _close,
      ),
    );
    overlay.insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) setState(() => _isOpen = false);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final selected = _selected;

    return CompositedTransformTarget(
      link: _layerLink,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowHoverHighlight: (value) => setState(() => _isHovered = value),
        onShowFocusHighlight: (value) => setState(() => _isFocused = value),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              _toggle();
              return null;
            },
          ),
        },
        child: GestureDetector(
          onTap: _toggle,
          child: AnimatedContainer(
            duration: AppDurations.fast,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space16,
              vertical: AppSpacing.space12,
            ),
            decoration: BoxDecoration(
              color: _isHovered ? colors.surfaceHigh : colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.radius12),
              border: Border.all(
                color: _isFocused || _isOpen ? AppColors.primary : colors.border,
                width: _isFocused ? 1.5 : 1,
              ),
            ),
            // IntrinsicWidth: como NexDropdown suele usarse como hijo
            // simple (no Expanded) de un Row externo, ese Row lo mide
            // primero con ancho no acotado (asi funciona Flex en
            // Flutter). Sin esto, el Expanded interno truena.
            child: IntrinsicWidth(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selected?.icon != null) ...[
                    Icon(selected!.icon, size: 16, color: colors.textSecondary),
                    const SizedBox(width: AppSpacing.space8),
                  ],
                  Flexible(
                    child: Text(
                      selected?.label ?? widget.hint ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        color: selected != null
                            ? colors.textPrimary
                            : colors.textDisabled,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space8),
                  AnimatedRotation(
                    turns: _isOpen ? 0.5 : 0,
                    duration: AppDurations.fast,
                    child: Icon(
                      Icons.expand_more,
                      size: 18,
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
