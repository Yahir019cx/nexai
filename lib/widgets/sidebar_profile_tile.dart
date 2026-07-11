import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

class SidebarProfileTile extends StatelessWidget {
  const SidebarProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

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
            'Invitado',
            style: AppTextStyles.body.copyWith(color: colors.textPrimary),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(Icons.settings_outlined, size: 18, color: colors.textDisabled),
        const SizedBox(width: AppSpacing.space8),
        Icon(Icons.logout_outlined, size: 18, color: colors.textDisabled),
      ],
    );
  }
}
