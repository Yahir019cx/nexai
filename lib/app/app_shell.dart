import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/utils/breakpoints.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  static const double _sidebarWidth = 280;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final width = MediaQuery.sizeOf(context).width;
    final showPersistentSidebar = Breakpoints.isDesktop(width);

    return Scaffold(
      backgroundColor: colors.background,
      body: Row(
        children: [
          if (showPersistentSidebar)
            SizedBox(
              width: _sidebarWidth,
              child: _SidebarPlaceholder(colors: colors),
            ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

/// Marcador temporal de la Sidebar. Se reemplazará por NexSidebar
/// (con navegación, historial y estados) en el siguiente paso.
class _SidebarPlaceholder extends StatelessWidget {
  const _SidebarPlaceholder({required this.colors});

  final NexColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space16),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(right: BorderSide(color: colors.border)),
      ),
    );
  }
}
