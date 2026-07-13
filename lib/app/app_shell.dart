import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/curves.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/utils/breakpoints.dart';
import 'package:nexai/widgets/living_background.dart';
import 'package:nexai/widgets/nex_sidebar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const double _sidebarWidth = 280;

  bool _isTabletSidebarCollapsed = false;
  bool _isMobileSidebarOpen = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = Breakpoints.isDesktop(width);
    final isTablet = Breakpoints.isTablet(width);
    final isMobile = Breakpoints.isMobile(width);

    // Desktop: sidebar siempre fija. Tablet: sidebar en línea pero
    // colapsable (el contenido se reacomoda). Mobile: panel deslizable
    // sobre el contenido (doc 008).
    final showInlineSidebar =
        isDesktop || (isTablet && !_isTabletSidebarCollapsed);
    final showToggleButton = isTablet || isMobile;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(child: LivingBackground()),
          Row(
            children: [
              ClipRect(
                child: AnimatedAlign(
                  duration: AppDurations.normal,
                  curve: AppCurves.standard,
                  alignment: Alignment.centerLeft,
                  widthFactor: showInlineSidebar ? 1 : 0,
                  child: const SizedBox(
                    width: _sidebarWidth,
                    child: NexSidebar(),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    widget.child,
                    if (showToggleButton)
                      Positioned(
                        top: AppSpacing.space16,
                        left: AppSpacing.space16,
                        child: _MenuToggleButton(
                          onTap: () => setState(() {
                            if (isTablet) {
                              _isTabletSidebarCollapsed =
                                  !_isTabletSidebarCollapsed;
                            } else {
                              _isMobileSidebarOpen = !_isMobileSidebarOpen;
                            }
                          }),
                        ),
                      ),
                    if (isMobile)
                      _SidebarOverlay(
                        isOpen: _isMobileSidebarOpen,
                        width: _sidebarWidth,
                        onDismiss: () =>
                            setState(() => _isMobileSidebarOpen = false),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Panel deslizable propio para Mobile (doc 999 prohíbe usar el
/// Drawer por defecto de Flutter como diseño final).
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
              curve: AppCurves.standard,
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
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (value) => setState(() => _isHovered = value),
      onShowFocusHighlight: (value) => setState(() => _isFocused = value),
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
        child: AnimatedContainer(
          duration: AppDurations.fast,
          padding: const EdgeInsets.all(AppSpacing.space8),
          decoration: BoxDecoration(
            color: _isHovered ? colors.surfaceHigh : colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.radius8),
            border: Border.all(
              color: _isFocused ? AppColors.primary : colors.border,
              width: _isFocused ? 1.5 : 1,
            ),
          ),
          child: Icon(Icons.menu, size: 18, color: colors.textPrimary),
        ),
      ),
    );
  }
}
