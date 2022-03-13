import 'package:flutball/main.dart' as app;
import 'package:flutball/presentation/competition/components/club_icon.dart';
import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutball/presentation/competition/views/competition_header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('''
    GIVEN App
    WHEN launched
    THEN should display data if the api answer correctly
    ''', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(CompetitionHeader), findsOneWidget);
      expect(find.byType(CompetitionIcon), findsNWidgets(2));
      expect(find.byType(KeyTitleAndBoldValueText), findsWidgets);
    });
  });
}
