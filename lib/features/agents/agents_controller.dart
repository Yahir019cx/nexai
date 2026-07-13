import 'package:flutter/material.dart';
import 'package:nexai/models/agent_model.dart';

/// Los agentes viven en memoria: no hay backend que los persista ni
/// que los ejecute realmente todavía (doc013 Fase 7).
class AgentsController extends ChangeNotifier {
  AgentsController() {
    _seedAgents();
  }

  final List<AgentModel> _agents = [];
  int _idCounter = 0;

  List<AgentModel> get agents => List.unmodifiable(_agents);

  void _seedAgents() {
    _agents.addAll([
      AgentModel(
        id: _generateId(),
        name: 'Asistente de escritura',
        description: 'Ayuda a redactar y mejorar textos.',
        instructions:
            'Eres un asistente experto en redacción. Responde con un tono '
            'claro, profesional y directo.',
      ),
      AgentModel(
        id: _generateId(),
        name: 'Analista de datos',
        description: 'Explica y resume información compleja.',
        instructions:
            'Eres un analista de datos. Explica hallazgos de forma simple, '
            'usando ejemplos concretos cuando sea posible.',
      ),
    ]);
  }

  AgentModel? agentById(String id) {
    for (final agent in _agents) {
      if (agent.id == id) return agent;
    }
    return null;
  }

  void createAgent({
    required String name,
    required String description,
    required String instructions,
  }) {
    _agents.add(
      AgentModel(
        id: _generateId(),
        name: name,
        description: description,
        instructions: instructions,
      ),
    );
    notifyListeners();
  }

  void updateAgent(
    String id, {
    required String name,
    required String description,
    required String instructions,
  }) {
    final index = _agents.indexWhere((agent) => agent.id == id);
    if (index == -1) return;
    _agents[index] = _agents[index].copyWith(
      name: name,
      description: description,
      instructions: instructions,
    );
    notifyListeners();
  }

  void deleteAgent(String id) {
    _agents.removeWhere((agent) => agent.id == id);
    notifyListeners();
  }

  String _generateId() =>
      '${DateTime.now().microsecondsSinceEpoch}-${_idCounter++}';
}
