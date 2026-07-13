import 'package:flutter/material.dart';
import 'package:nexai/features/chat/available_models.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/widgets/nex_dropdown.dart';
import 'package:nexai/widgets/nex_tooltip.dart';
import 'package:provider/provider.dart';

/// Selector de modelo activo (doc 013 Fase 5). El tooltip muestra la
/// descripción del modelo seleccionado ("Información del modelo").
class ModelSelector extends StatelessWidget {
  const ModelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = context.watch<ChatController>();
    final selectedModel = aiModelById(chatController.selectedModelId);

    return NexTooltip(
      message: selectedModel?.description ?? 'Selecciona un modelo',
      child: NexDropdown<String>(
        value: chatController.selectedModelId,
        hint: 'Modelo',
        items: [
          for (final model in availableAiModels)
            NexDropdownItem(
              value: model.id,
              label: model.name,
              icon: model.isLocal ? Icons.dns_outlined : Icons.cloud_outlined,
            ),
        ],
        onChanged: chatController.selectModel,
      ),
    );
  }
}
