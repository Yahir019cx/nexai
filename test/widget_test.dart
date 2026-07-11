import 'package:flutter_test/flutter_test.dart';
import 'package:nexai/app/app.dart';
import 'package:nexai/app/bootstrap_home.dart';

void main() {
  testWidgets('NexaiApp renders the bootstrap screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NexaiApp());
    await tester.pumpAndSettle();

    final bootstrapTitle = find.descendant(
      of: find.byType(BootstrapHome),
      matching: find.text('NEXAI'),
    );

    expect(bootstrapTitle, findsOneWidget);
  });
}
