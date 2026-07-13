import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

class SidebarNavItem extends StatefulWidget {
  const SidebarNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.isEnabled = true,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback? onTap;

  @override
  State<SidebarNavItem> createState() => _SidebarNavItemState();
}

class _SidebarNavItemState extends State<SidebarNavItem> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    final Color background = widget.isSelected
        ? colors.surfaceVariant
        : (_isHovered ? colors.surfaceHigh : Colors.transparent);

    final Color foreground = !widget.isEnabled
        ? colors.textDisabled
        : (widget.isSelected ? colors.textPrimary : colors.textSecondary);

    return Opacity(
      opacity: widget.isEnabled ? 1 : 0.6,
      child: FocusableActionDetector(
        enabled: widget.isEnabled,
        mouseCursor: widget.isEnabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onShowHoverHighlight: (value) => setState(() => _isHovered = value),
        onShowFocusHighlight: (value) => setState(() => _isFocused = value),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onTap?.call();
              return null;
            },
          ),
        },
        child: GestureDetector(
          onTap: widget.isEnabled ? widget.onTap : null,
          child: AnimatedContainer(
            duration: AppDurations.fast,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space12,
              vertical: AppSpacing.space12,
            ),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(AppRadius.radius8),
              border: Border.all(
                color: _isFocused ? AppColors.primary : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(widget.icon, size: 18, color: foreground),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Text(
                    widget.label,
                    style: AppTextStyles.body.copyWith(color: foreground),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
