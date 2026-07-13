import 'package:nexai/models/ai_model.dart';

/// Lista de modelos disponibles (doc 013 Fase 5). No hay backend de
/// IA conectado todavía: son datos de referencia para construir el
/// selector, no una integración real.
const List<AiModel> availableAiModels = [
  AiModel(
    id: 'nexai-pro',
    name: 'NEXAI Pro',
    description: 'El modelo más capaz, ideal para tareas complejas.',
    isLocal: false,
  ),
  AiModel(
    id: 'nexai-flash',
    name: 'NEXAI Flash',
    description: 'Respuestas rápidas para el uso diario.',
    isLocal: false,
  ),
  AiModel(
    id: 'llama-local',
    name: 'Llama Local',
    description: 'Modelo local vía Ollama, sin conexión a internet.',
    isLocal: true,
  ),
];

AiModel? aiModelById(String id) {
  for (final model in availableAiModels) {
    if (model.id == id) return model;
  }
  return null;
}
