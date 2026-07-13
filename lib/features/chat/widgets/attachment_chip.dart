import 'package:flutter/material.dart';
import 'package:nexai/core/utils/formatters.dart';
import 'package:nexai/features/chat/attachment_icons.dart';
import 'package:nexai/models/attachment_model.dart';
import 'package:nexai/widgets/nex_chip.dart';

/// Adjunto mostrado como chip (doc 006/013: "Adjuntar archivos,
/// Vista previa, Eliminación"). onRemove solo se pasa antes de
/// enviar; en un mensaje ya enviado el adjunto no se puede quitar.
class AttachmentChip extends StatelessWidget {
  const AttachmentChip({super.key, required this.attachment, this.onRemove});

  final AttachmentModel attachment;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return NexChip(
      label: '${attachment.fileName} (${formatFileSize(attachment.sizeBytes)})',
      icon: iconForAttachment(attachment.fileName),
      onRemove: onRemove,
    );
  }
}
