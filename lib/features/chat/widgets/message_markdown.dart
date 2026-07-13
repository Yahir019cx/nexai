import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_toast.dart';

/// Renderiza el markdown de una respuesta con la tipografía y
/// colores propios de NEXAI (doc 006), incluyendo botón de copiar
/// en los bloques de código.
class MessageMarkdown extends StatelessWidget {
  const MessageMarkdown({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final basePreConfig = isDark ? PreConfig.darkConfig : const PreConfig();

    return MarkdownBlock(
      data: data,
      config: (isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig)
          .copy(
            configs: [
              PConfig(
                textStyle: AppTextStyles.body.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              CodeConfig(
                style: AppTextStyles.body.copyWith(
                  color: AppColors.primary,
                  fontFamily: 'monospace',
                ),
              ),
              basePreConfig.copy(
                decoration: BoxDecoration(
                  color: colors.surfaceHigh,
                  borderRadius: BorderRadius.circular(AppRadius.radius12),
                  border: Border.all(color: colors.border),
                ),
                textStyle: AppTextStyles.body.copyWith(
                  fontFamily: 'monospace',
                ),
                wrapper: (child, code, language) =>
                    _CodeBlockWrapper(code: code, child: child),
              ),
            ],
          ),
    );
  }
}

class _CodeBlockWrapper extends StatelessWidget {
  const _CodeBlockWrapper({required this.child, required this.code});

  final Widget child;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: AppSpacing.space8,
          right: AppSpacing.space8,
          child: _CopyCodeButton(code: code),
        ),
      ],
    );
  }
}

class _CopyCodeButton extends StatefulWidget {
  const _CopyCodeButton({required this.code});

  final String code;

  @override
  State<_CopyCodeButton> createState() => _CopyCodeButtonState();
}

class _CopyCodeButtonState extends State<_CopyCodeButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: widget.code));
          if (context.mounted) {
            NexToast.show(context, message: 'Código copiado');
          }
        },
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.space4),
          decoration: BoxDecoration(
            color: colors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppRadius.radius8),
          ),
          child: Icon(
            Icons.copy_outlined,
            size: 14,
            color: _isHovered ? colors.textPrimary : colors.textSecondary,
          ),
        ),
      ),
    );
  }
}
