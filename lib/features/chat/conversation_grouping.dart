import 'package:nexai/models/conversation_model.dart';

/// Agrupa conversaciones por fecha (doc 006): Hoy, Ayer, Esta
/// semana, Este mes, Más antiguas. El orden de las llaves ya
/// devuelto respeta ese orden.
Map<String, List<ConversationModel>> groupConversationsByDate(
  List<ConversationModel> conversations,
) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
  final startOfMonth = DateTime(now.year, now.month, 1);

  final groups = <String, List<ConversationModel>>{
    'Hoy': [],
    'Ayer': [],
    'Esta semana': [],
    'Este mes': [],
    'Más antiguas': [],
  };

  for (final conversation in conversations) {
    final date = conversation.updatedAt;
    final day = DateTime(date.year, date.month, date.day);

    if (day == today) {
      groups['Hoy']!.add(conversation);
    } else if (day == yesterday) {
      groups['Ayer']!.add(conversation);
    } else if (!day.isBefore(startOfWeek)) {
      groups['Esta semana']!.add(conversation);
    } else if (!day.isBefore(startOfMonth)) {
      groups['Este mes']!.add(conversation);
    } else {
      groups['Más antiguas']!.add(conversation);
    }
  }

  groups.removeWhere((_, conversations) => conversations.isEmpty);
  return groups;
}
