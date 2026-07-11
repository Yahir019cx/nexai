import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

class SidebarNewChatButton extends StatefulWidget {
  const SidebarNewChatButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<SidebarNewChatButton> createState() => _SidebarNewChatButtonState();
}

class _SidebarNewChatButtonState extends State<SidebarNewChatButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isPressed ? 0.97 : 1,
          duration: AppDurations.fast,
          child: AnimatedContainer(
            duration: AppDurations.fast,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space16,
              vertical: AppSpacing.space12,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: _isHovered ? 1 : 0.9),
              borderRadius: BorderRadius.circular(AppRadius.radius12),
            ),
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.white, size: 18),
                const SizedBox(width: AppSpacing.space8),
                Text(
                  'Nuevo chat',
                  style: AppTextStyles.label.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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
