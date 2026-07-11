import 'package:flutter_test/flutter_test.dart';

import 'package:nexai/app/app.dart';

void main() {
  testWidgets('NexaiApp renders the bootstrap screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NexaiApp());

    expect(find.text('NEXAI'), findsOneWidget);
  });
}
