import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/widgets/nex_toast.dart';
import 'package:nexai/widgets/nex_tooltip.dart';

/// Acciones que aparecen al pasar el cursor sobre un mensaje
/// (doc 006): copiar siempre, editar (mensajes de usuario) o
/// regenerar (respuestas de la IA) cuando aplique.
class MessageActions extends StatelessWidget {
  const MessageActions({
    super.key,
    required this.content,
    this.onEdit,
    this.onRegenerate,
  });

  final String content;
  final VoidCallback? onEdit;
  final VoidCallback? onRegenerate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        NexTooltip(
          message: 'Copiar',
          child: _ActionIcon(
            icon: Icons.copy_outlined,
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: content));
              if (context.mounted) {
                NexToast.show(context, message: 'Copiado al portapapeles');
              }
            },
          ),
        ),
        if (onEdit != null)
          NexTooltip(
            message: 'Editar',
            child: _ActionIcon(icon: Icons.edit_outlined, onTap: onEdit!),
          ),
        if (onRegenerate != null)
          NexTooltip(
            message: 'Regenerar',
            child: _ActionIcon(icon: Icons.refresh, onTap: onRegenerate!),
          ),
      ],
    );
  }
}

class _ActionIcon extends StatefulWidget {
  const _ActionIcon({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_ActionIcon> createState() => _ActionIconState();
}

class _ActionIconState extends State<_ActionIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.space8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Icon(
            widget.icon,
            size: 14,
            color: _isHovered ? colors.textPrimary : colors.textDisabled,
          ),
        ),
      ),
    );
  }
}
