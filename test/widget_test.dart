import 'package:flutter_test/flutter_test.dart';
import 'package:silent_circle/main.dart';

void main() {
  testWidgets('Silent Circle app loads main tabs', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SilentCircleApp());

    // Verify that Silent Circle title and tabs appear.
    expect(find.text('Silent Circle'), findsOneWidget);
    expect(find.text('Circle'), findsOneWidget);
    expect(find.text('Vault'), findsOneWidget);
    expect(find.text('Resources'), findsOneWidget);
  });
}
