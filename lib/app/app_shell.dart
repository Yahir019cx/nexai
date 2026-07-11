import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/utils/breakpoints.dart';
import 'package:nexai/widgets/nex_sidebar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const double _sidebarWidth = 280;

  bool _isOverlaySidebarOpen = false;

  void _toggleOverlaySidebar() {
    setState(() => _isOverlaySidebarOpen = !_isOverlaySidebarOpen);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final width = MediaQuery.sizeOf(context).width;
    final isPersistentSidebar = Breakpoints.isDesktop(width);

    return Scaffold(
      backgroundColor: colors.background,
      body: Row(
        children: [
          if (isPersistentSidebar)
            const SizedBox(width: _sidebarWidth, child: NexSidebar()),
          Expanded(
            child: Stack(
              children: [
                widget.child,
                if (!isPersistentSidebar) ...[
                  Positioned(
                    top: AppSpacing.space16,
                    left: AppSpacing.space16,
                    child: _MenuToggleButton(onTap: _toggleOverlaySidebar),
                  ),
                  _SidebarOverlay(
                    isOpen: _isOverlaySidebarOpen,
                    width: _sidebarWidth,
                    onDismiss: _toggleOverlaySidebar,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Panel deslizable propio para Tablet/Mobile (doc 999 prohíbe usar
/// el Drawer por defecto de Flutter como diseño final).
class _SidebarOverlay extends StatelessWidget {
  const _SidebarOverlay({
    required this.isOpen,
    required this.width,
    required this.onDismiss,
  });

  final bool isOpen;
  final double width;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !isOpen,
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: isOpen ? 1 : 0,
              duration: AppDurations.normal,
              child: GestureDetector(
                onTap: onDismiss,
                child: Container(color: Colors.black.withValues(alpha: 0.5)),
              ),
            ),
            AnimatedPositioned(
              duration: AppDurations.normal,
              curve: Curves.easeOutCubic,
              left: isOpen ? 0 : -width,
              top: 0,
              bottom: 0,
              width: width,
              child: const NexSidebar(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuToggleButton extends StatefulWidget {
  const _MenuToggleButton({required this.onTap});

  final VoidCallback onTap;

  @override
  State<_MenuToggleButton> createState() => _MenuToggleButtonState();
}

class _MenuToggleButtonState extends State<_MenuToggleButton> {
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
        child: AnimatedContainer(
          duration: AppDurations.fast,
          padding: const EdgeInsets.all(AppSpacing.space8),
          decoration: BoxDecoration(
            color: _isHovered ? colors.surfaceHigh : colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.radius8),
            border: Border.all(color: colors.border),
          ),
          child: Icon(Icons.menu, size: 18, color: colors.textPrimary),
        ),
      ),
    );
  }
}
