import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_dropdown.dart';
import 'package:nexai/widgets/nex_menu_entrance.dart';

class NexDropdownOverlay<T> extends StatelessWidget {
  const NexDropdownOverlay({
    super.key,
    required this.layerLink,
    required this.width,
    required this.items,
    required this.selectedValue,
    required this.onSelected,
    required this.onDismiss,
  });

  final LayerLink layerLink;
  final double width;
  final List<NexDropdownItem<T>> items;
  final T? selectedValue;
  final ValueChanged<T> onSelected;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onDismiss,
          ),
        ),
        CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.topLeft,
          offset: const Offset(0, AppSpacing.space4),
          child: NexMenuEntrance(
            child: Container(
              width: width,
              constraints: const BoxConstraints(maxHeight: 280),
              decoration: BoxDecoration(
                color: colors.surfaceVariant,
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
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.space4,
                ),
                children: [
                  for (final item in items)
                    _DropdownOptionTile<T>(
                      item: item,
                      isSelected: item.value == selectedValue,
                      onTap: () => onSelected(item.value),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DropdownOptionTile<T> extends StatefulWidget {
  const _DropdownOptionTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final NexDropdownItem<T> item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_DropdownOptionTile<T>> createState() => _DropdownOptionTileState<T>();
}

class _DropdownOptionTileState<T> extends State<_DropdownOptionTile<T>> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space12,
            vertical: AppSpacing.space8,
          ),
          color: widget.isSelected
              ? AppColors.primary.withValues(alpha: 0.12)
              : (_isHovered ? colors.surfaceHigh : Colors.transparent),
          child: Row(
            children: [
              if (widget.item.icon != null) ...[
                Icon(widget.item.icon, size: 16, color: colors.textSecondary),
                const SizedBox(width: AppSpacing.space8),
              ],
              Expanded(
                child: Text(
                  widget.item.label,
                  style: AppTextStyles.body.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              if (widget.isSelected)
                Icon(Icons.check, size: 16, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
