import 'package:flutter/material.dart';
import 'package:nexai/core/constants/spacing.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';
import 'package:nexai/features/agents/agents_controller.dart';
import 'package:nexai/features/agents/widgets/agent_card.dart';
import 'package:nexai/features/agents/widgets/agent_form.dart';
import 'package:nexai/widgets/nex_button.dart';
import 'package:nexai/widgets/nex_empty_state.dart';
import 'package:provider/provider.dart';

/// Pantalla de Agentes (doc013 Fase 7): lista, crear, editar,
/// ejecutar. Sin backend: los agentes viven en memoria.
class AgentsPage extends StatelessWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final agentsController = context.watch<AgentsController>();
    final colors = Theme.of(context).extension<NexColors>()!;
    final agents = agentsController.agents;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.space32),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Agentes',
                    style: AppTextStyles.headline.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                NexButton(
                  label: 'Crear agente',
                  icon: Icons.add,
                  onPressed: () => showAgentFormModal(context),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space32),
            if (agents.isEmpty)
              NexEmptyState(
                title: 'Aún no tienes agentes',
                description:
                    'Crea uno para automatizar tareas con instrucciones propias.',
                icon: Icons.smart_toy_outlined,
                actionLabel: 'Crear agente',
                onAction: () => showAgentFormModal(context),
              )
            else
              Wrap(
                spacing: AppSpacing.space16,
                runSpacing: AppSpacing.space16,
                children: [
                  for (final agent in agents)
                    SizedBox(width: 320, child: AgentCard(agent: agent)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
