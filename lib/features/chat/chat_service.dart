/// Servicio simulado: NEXAI todavía no tiene un backend de IA real
/// conectado (elegir proveedor, credenciales, protocolo de streaming
/// es una decisión de producto pendiente). Este servicio permite
/// construir y validar toda la experiencia del chat mientras tanto.
class ChatService {
  Stream<String> streamAssistantReply(String prompt) async* {
    final reply = _mockReplyFor(prompt);
    final words = reply.split(' ');
    final buffer = StringBuffer();

    for (final word in words) {
      await Future.delayed(const Duration(milliseconds: 35));
      if (buffer.isNotEmpty) buffer.write(' ');
      buffer.write(word);
      yield buffer.toString();
    }
  }

  String _mockReplyFor(String prompt) {
    return '''
Esto es una respuesta simulada de **NEXAI**. Todavía no hay un modelo de IA real conectado, así que este texto sirve únicamente para validar la experiencia del chat: streaming, markdown y bloques de código.

Preguntaste:

> $prompt

Un ejemplo de bloque de código:

```dart
void main() {
  print('Hola, NEXAI');
}
```

- Los mensajes aparecen progresivamente.
- El markdown se renderiza con estilos propios.
- El código tiene resaltado de sintaxis y botón de copiar.
''';
  }
}
