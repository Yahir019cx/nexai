import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexai/app/router.dart';
import 'package:nexai/core/constants/border_radius.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/agents/agents_controller.dart';
import 'package:nexai/features/agents/widgets/agent_form.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/models/agent_model.dart';
import 'package:nexai/widgets/nex_button.dart';
import 'package:nexai/widgets/nex_card.dart';
import 'package:nexai/widgets/nex_dialog.dart';
import 'package:provider/provider.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({super.key, required this.agent});

  final AgentModel agent;

  void _execute(BuildContext context) {
    context.read<ChatController>().startConversationWithAgent(agent);
    context.go(AppRoutes.home);
  }

  Future<void> _confirmDelete(BuildContext context) {
    return showNexDialog(
      context: context,
      title: 'Eliminar agente',
      message:
          '¿Seguro que quieres eliminar "${agent.name}"? Esta acción no se '
          'puede deshacer.',
      actions: [
        NexDialogAction(
          label: 'Cancelar',
          onPressed: () => Navigator.of(context).pop(),
        ),
        NexDialogAction(
          label: 'Eliminar',
          variant: NexButtonVariant.danger,
          onPressed: () {
            context.read<AgentsController>().deleteAgent(agent.id);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return NexCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppSpacing.space40,
                height: AppSpacing.space40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppRadius.radius12),
                ),
                child: Icon(
                  Icons.smart_toy_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Text(
                  agent.name,
                  style: AppTextStyles.title.copyWith(
                    color: colors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space8),
          Text(
            agent.description,
            style: AppTextStyles.body.copyWith(color: colors.textSecondary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(
                child: NexButton(
                  label: 'Ejecutar',
                  icon: Icons.play_arrow_rounded,
                  onPressed: () => _execute(context),
                ),
              ),
              const SizedBox(width: AppSpacing.space8),
              NexButton(
                icon: Icons.edit_outlined,
                variant: NexButtonVariant.ghost,
                onPressed: () =>
                    showAgentFormModal(context, existingAgent: agent),
              ),
              const SizedBox(width: AppSpacing.space8),
              NexButton(
                icon: Icons.delete_outline,
                variant: NexButtonVariant.ghost,
                onPressed: () => _confirmDelete(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
