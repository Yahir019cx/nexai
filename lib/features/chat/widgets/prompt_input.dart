import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/widgets/nex_button.dart';

/// El componente más importante del proyecto (doc 022): debe
/// sentirse como una herramienta profesional, no un TextField.
/// Ctrl+Enter envía, Enter/Shift+Enter insertan salto de línea
/// (doc 023). Mientras se envía, el botón se convierte en "detener"
/// (doc 006: estado "Cancelado").
class PromptInput extends StatefulWidget {
  const PromptInput({
    super.key,
    required this.onSend,
    this.onStop,
    this.controller,
    this.isSending = false,
  });

  final ValueChanged<String> onSend;
  final VoidCallback? onStop;
  final TextEditingController? controller;
  final bool isSending;

  @override
  State<PromptInput> createState() => _PromptInputState();
}

class _PromptInputState extends State<PromptInput> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _ownsController = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _ownsController = widget.controller == null;
    _hasText = _controller.text.trim().isNotEmpty;
    _controller.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    final hasText = _controller.text.trim().isNotEmpty;
    if (hasText != _hasText) setState(() => _hasText = hasText);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    if (_ownsController) _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (widget.isSending || !_hasText) return;
    final text = _controller.text;
    _controller.clear();
    widget.onSend(text);
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    final isSendCombo =
        event.logicalKey == LogicalKeyboardKey.enter &&
        (HardwareKeyboard.instance.isControlPressed ||
            HardwareKeyboard.instance.isMetaPressed);

    if (event is KeyDownEvent && isSendCombo) {
      _handleSend();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.space12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.radius16),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Focus(
              onKeyEvent: _handleKeyEvent,
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                minLines: 1,
                maxLines: 8,
                enabled: !widget.isSending,
                style: AppTextStyles.body.copyWith(color: colors.textPrimary),
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  isCollapsed: true,
                  hintText: 'Escribe un mensaje…',
                  hintStyle: AppTextStyles.body.copyWith(
                    color: colors.textDisabled,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.space8),
          NexButton(
            icon: widget.isSending ? Icons.stop_rounded : Icons.arrow_upward,
            variant: widget.isSending
                ? NexButtonVariant.secondary
                : NexButtonVariant.primary,
            onPressed: widget.isSending
                ? widget.onStop
                : (_hasText ? _handleSend : null),
          ),
        ],
      ),
    );
  }
}
