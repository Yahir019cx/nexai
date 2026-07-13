import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:nexai/app/router.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/features/chat/widgets/sidebar_conversation_history.dart';
import 'package:nexai/widgets/nex_button.dart';
import 'package:nexai/widgets/nex_divider.dart';
import 'package:nexai/widgets/sidebar_logo_mark.dart';
import 'package:nexai/widgets/sidebar_nav_item.dart';
import 'package:nexai/widgets/sidebar_profile_tile.dart';
import 'package:provider/provider.dart';

class NexSidebar extends StatelessWidget {
  const NexSidebar({super.key, required this.currentLocation});

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    final navItems = <Widget>[
      const SidebarNavItem(
        icon: Icons.search,
        label: 'Buscar',
        isEnabled: false,
      ),
      SidebarNavItem(
        icon: Icons.smart_toy_outlined,
        label: 'Agentes',
        isSelected: currentLocation == AppRoutes.agents,
        onTap: () => context.go(AppRoutes.agents),
      ),
      SidebarNavItem(
        icon: Icons.settings_outlined,
        label: 'Configuración',
        isSelected: currentLocation == AppRoutes.settings,
        onTap: () => context.go(AppRoutes.settings),
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
            NexButton(
              label: 'Nuevo chat',
              icon: Icons.add,
              onPressed: () =>
                  context.read<ChatController>().startNewConversation(),
            ),
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
            const NexDivider(),
            const SizedBox(height: AppSpacing.space12),
            const Expanded(child: SidebarConversationHistory()),
            const SizedBox(height: AppSpacing.space12),
            const NexDivider(),
            const SizedBox(height: AppSpacing.space16),
            const SidebarProfileTile(),
          ],
        ),
      ),
    );
  }
}
