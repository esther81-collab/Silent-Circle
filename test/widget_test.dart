import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:silent_circle/main.dart';
import 'package:silent_circle/providers/app_state.dart';

void main() {
  testWidgets('Silent Circle app loads all 5 required feature tabs with Provider', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppState(),
        child: const SilentCircleApp(),
      ),
    );

    // Verify main title and 5 nav tabs appear.
    expect(find.text('Silent Circle'), findsOneWidget);
    expect(find.text('Circle'), findsOneWidget);
    expect(find.text('Vault'), findsOneWidget);
    expect(find.text('Plan'), findsOneWidget);
    expect(find.text('Bystander'), findsOneWidget);
    expect(find.text('Resources'), findsOneWidget);
  });
}
