import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/agents/agents_controller.dart';
import 'package:nexai/models/agent_model.dart';
import 'package:nexai/widgets/nex_button.dart';
import 'package:nexai/widgets/nex_input.dart';
import 'package:nexai/widgets/nex_modal.dart';
import 'package:nexai/widgets/nex_textarea.dart';
import 'package:provider/provider.dart';

/// Formulario de creación/edición de agente (doc013 Fase 7).
Future<void> showAgentFormModal(
  BuildContext context, {
  AgentModel? existingAgent,
}) {
  return showNexModal(
    context: context,
    builder: (context) => AgentForm(existingAgent: existingAgent),
  );
}

class AgentForm extends StatefulWidget {
  const AgentForm({super.key, this.existingAgent});

  final AgentModel? existingAgent;

  @override
  State<AgentForm> createState() => _AgentFormState();
}

class _AgentFormState extends State<AgentForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _instructionsController;

  @override
  void initState() {
    super.initState();
    final agent = widget.existingAgent;
    _nameController = TextEditingController(text: agent?.name ?? '');
    _descriptionController = TextEditingController(
      text: agent?.description ?? '',
    );
    _instructionsController = TextEditingController(
      text: agent?.instructions ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final agentsController = context.read<AgentsController>();
    final description = _descriptionController.text.trim();
    final instructions = _instructionsController.text.trim();

    if (widget.existingAgent != null) {
      agentsController.updateAgent(
        widget.existingAgent!.id,
        name: name,
        description: description,
        instructions: instructions,
      );
    } else {
      agentsController.createAgent(
        name: name,
        description: description,
        instructions: instructions,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;
    final isEditing = widget.existingAgent != null;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isEditing ? 'Editar agente' : 'Crear agente',
            style: AppTextStyles.title.copyWith(color: colors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.space20),
          NexInput(label: 'Nombre', controller: _nameController),
          const SizedBox(height: AppSpacing.space16),
          NexTextarea(
            label: 'Descripción',
            controller: _descriptionController,
            minLines: 2,
            maxLines: 3,
          ),
          const SizedBox(height: AppSpacing.space16),
          NexTextarea(
            label: 'Instrucciones',
            controller: _instructionsController,
            minLines: 3,
            maxLines: 6,
          ),
          const SizedBox(height: AppSpacing.space24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NexButton(
                label: 'Cancelar',
                variant: NexButtonVariant.secondary,
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: AppSpacing.space12),
              NexButton(label: 'Guardar', onPressed: _handleSave),
            ],
          ),
        ],
      ),
    );
  }
}
