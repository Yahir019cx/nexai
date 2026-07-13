import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexai/app/app.dart';
import 'package:nexai/features/chat/widgets/chat_welcome.dart';

void main() {
  testWidgets('NexaiApp renders the chat welcome state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NexaiApp());
    // No se usa pumpAndSettle: el fondo vivo (LivingBackground) anima
    // en bucle infinito y nunca "se asienta".
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(ChatWelcome), findsOneWidget);
  });

  for (final width in [1440.0, 900.0, 400.0]) {
    testWidgets('AppShell no genera overflows en ancho ${width}px', (
      WidgetTester tester,
    ) async {
      // setSurfaceSize cambia el tamaño real de render pero no
      // actualiza MediaQuery; tester.view.physicalSize sí lo hace,
      // que es lo que necesita la lógica de breakpoints (MediaQuery).
      tester.view.physicalSize = Size(width, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const NexaiApp());
      await tester.pump(const Duration(seconds: 1));

      expect(tester.takeException(), isNull);
    });
  }
}
