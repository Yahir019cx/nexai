import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:nexai/app/router.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/sidebar_logo_mark.dart';
import 'package:nexai/widgets/sidebar_nav_item.dart';
import 'package:nexai/widgets/sidebar_new_chat_button.dart';
import 'package:nexai/widgets/sidebar_profile_tile.dart';

class NexSidebar extends StatelessWidget {
  const NexSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    final navItems = <Widget>[
      const SidebarNavItem(
        icon: Icons.search,
        label: 'Buscar',
        isEnabled: false,
      ),
      const SidebarNavItem(
        icon: Icons.settings_outlined,
        label: 'Configuración',
        isEnabled: false,
      ),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(right: BorderSide(color: colors.border)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SidebarLogoMark(),
            const SizedBox(height: AppSpacing.space24),
            SidebarNewChatButton(onTap: () => context.go(AppRoutes.home)),
            const SizedBox(height: AppSpacing.space20),
            for (var index = 0; index < navItems.length; index++)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.space4),
                child: navItems[index]
                    .animate()
                    .fadeIn(
                      duration: AppDurations.normal,
                      delay: AppDurations.fast * index,
                    )
                    .slideX(begin: -0.05, end: 0),
              ),
            const SizedBox(height: AppSpacing.space12),
            Container(height: 1, color: colors.border),
            const SizedBox(height: AppSpacing.space12),
            Expanded(
              child: Center(
                child: Text(
                  'Aún no tienes conversaciones',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.caption.copyWith(
                    color: colors.textDisabled,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.space12),
            Container(height: 1, color: colors.border),
            const SizedBox(height: AppSpacing.space16),
            const SidebarProfileTile(),
          ],
        ),
      ),
    );
  }
}
