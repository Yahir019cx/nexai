import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexai/app/router.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/settings/settings_controller.dart';
import 'package:provider/provider.dart';

class SidebarProfileTile extends StatelessWidget {
  const SidebarProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final displayName = context.watch<SettingsController>().displayName;

    return Row(
      children: [
        Container(
          width: AppSpacing.space32,
          height: AppSpacing.space32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors.surfaceHigh,
            borderRadius: BorderRadius.circular(AppRadius.radius8),
          ),
          child: Icon(
            Icons.person_outline,
            size: 16,
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(width: AppSpacing.space12),
        Expanded(
          child: Text(
            displayName,
            style: AppTextStyles.body.copyWith(color: colors.textPrimary),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _ProfileIconAction(
          icon: Icons.settings_outlined,
          onTap: () => context.go(AppRoutes.settings),
        ),
        const SizedBox(width: AppSpacing.space8),
        Icon(Icons.logout_outlined, size: 18, color: colors.textDisabled),
      ],
    );
  }
}

class _ProfileIconAction extends StatefulWidget {
  const _ProfileIconAction({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_ProfileIconAction> createState() => _ProfileIconActionState();
}

class _ProfileIconActionState extends State<_ProfileIconAction> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (value) => setState(() => _isHovered = value),
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Icon(
          widget.icon,
          size: 18,
          color: _isHovered ? colors.textPrimary : colors.textSecondary,
        ),
      ),
    );
  }
}
