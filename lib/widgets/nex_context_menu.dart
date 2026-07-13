import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_menu_entrance.dart';

class NexContextMenuAction {
  const NexContextMenuAction({
    required this.label,
    required this.onSelected,
    this.icon,
    this.isDestructive = false,
  });

  final String label;
  final VoidCallback onSelected;
  final IconData? icon;
  final bool isDestructive;
}

/// Menú de acciones rápidas (clic derecho o presión larga), con
/// blur de fondo y excelente separación (doc 022).
class NexContextMenu extends StatefulWidget {
  const NexContextMenu({
    super.key,
    required this.actions,
    required this.child,
  });

  final List<NexContextMenuAction> actions;
  final Widget child;

  @override
  State<NexContextMenu> createState() => _NexContextMenuState();
}

class _NexContextMenuState extends State<NexContextMenu> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _open() {
    if (_overlayEntry != null) return;
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => _ContextMenuOverlay(
        layerLink: _layerLink,
        actions: widget.actions,
        onDismiss: _close,
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onSecondaryTap: _open,
        onLongPress: _open,
        child: widget.child,
      ),
    );
  }
}

class _ContextMenuOverlay extends StatelessWidget {
  const _ContextMenuOverlay({
    required this.layerLink,
    required this.actions,
    required this.onDismiss,
  });

  final LayerLink layerLink;
  final List<NexContextMenuAction> actions;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onDismiss,
          ),
        ),
        CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.topLeft,
          offset: const Offset(0, AppSpacing.space4),
          child: NexMenuEntrance(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.radius12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 180),
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.space4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant.withValues(alpha: 0.85),
                    border: Border.all(color: colors.border),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final action in actions)
                        _ContextMenuTile(action: action, onDismiss: onDismiss),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContextMenuTile extends StatefulWidget {
  const _ContextMenuTile({required this.action, required this.onDismiss});

  final NexContextMenuAction action;
  final VoidCallback onDismiss;

  @override
  State<_ContextMenuTile> createState() => _ContextMenuTileState();
}

class _ContextMenuTileState extends State<_ContextMenuTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final color = widget.action.isDestructive ? colors.error : colors.textPrimary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          widget.onDismiss();
          widget.action.onSelected();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space16,
            vertical: AppSpacing.space8,
          ),
          color: _isHovered ? colors.surfaceHigh : Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.action.icon != null) ...[
                Icon(widget.action.icon, size: 16, color: color),
                const SizedBox(width: AppSpacing.space8),
              ],
              Text(
                widget.action.label,
                style: AppTextStyles.body.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
