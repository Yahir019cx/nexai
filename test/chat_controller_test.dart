import 'package:flutter_test/flutter_test.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/models/message_model.dart';

void main() {
  group('ChatController', () {
    test('sendMessage crea el mensaje de usuario y la respuesta completa', () async {
      final controller = ChatController();

      await controller.sendMessage('Hola NEXAI');

      final messages = controller.activeConversation!.messages;
      expect(messages.first.role, MessageRole.user);
      expect(messages.last.role, MessageRole.assistant);
      expect(messages.last.status, MessageStatus.complete);
      expect(controller.isSending, isFalse);
    });

    test('cancelSending marca la respuesta como cancelada', () async {
      final controller = ChatController();

      final sendFuture = controller.sendMessage('Hola');
      // Cancelar durante la etapa de "pensando" (antes del streaming).
      controller.cancelSending();
      await sendFuture;

      final messages = controller.activeConversation!.messages;
      expect(messages.last.status, MessageStatus.cancelled);
      expect(controller.isSending, isFalse);
    });

    test('prepareEdit elimina el mensaje y los posteriores, y devuelve su contenido', () async {
      final controller = ChatController();
      await controller.sendMessage('Primer mensaje');

      final userMessageId = controller.activeConversation!.messages.first.id;
      final content = controller.prepareEdit(userMessageId);

      expect(content, 'Primer mensaje');
      expect(controller.activeConversation!.messages, isEmpty);
    });

    test('regenerateMessage vuelve a generar la respuesta del mismo prompt', () async {
      final controller = ChatController();
      await controller.sendMessage('Genera algo');

      final assistantMessageId = controller.activeConversation!.messages.last.id;
      await controller.regenerateMessage(assistantMessageId);

      final messages = controller.activeConversation!.messages;
      expect(messages.length, 2);
      expect(messages.last.role, MessageRole.assistant);
      expect(messages.last.status, MessageStatus.complete);
    });
  });
}
