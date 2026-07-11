import 'package:flutter_test/flutter_test.dart';
import 'package:nexai/app/app.dart';
import 'package:nexai/app/bootstrap_home.dart';

void main() {
  testWidgets('NexaiApp renders the bootstrap screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NexaiApp());
    // No se usa pumpAndSettle: el fondo vivo (LivingBackground) anima
    // en bucle infinito y nunca "se asienta".
    await tester.pump(const Duration(seconds: 1));

    final bootstrapTitle = find.descendant(
      of: find.byType(BootstrapHome),
      matching: find.text('NEXAI'),
    );

    expect(bootstrapTitle, findsOneWidget);
  });
}
