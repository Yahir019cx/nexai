import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

class SidebarLogoMark extends StatelessWidget {
  const SidebarLogoMark({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Row(
      children: [
        Container(
          width: AppSpacing.space24,
          height: AppSpacing.space24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.radius8),
          ),
          child: Text(
            'N',
            style: AppTextStyles.label.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.space12),
        Text(
          'NEXAI',
          style: AppTextStyles.title.copyWith(
            color: colors.textPrimary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
