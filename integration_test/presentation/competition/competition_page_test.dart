import 'package:flutball/main.dart' as app;
import 'package:flutball/presentation/competition/components/circular_loading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('''
    GIVEN App
    WHEN launched
    THEN should display data if the api answer correctly
    ''',
            (WidgetTester tester) async {

          app.main();

          await tester.pumpAndSettle(const Duration(seconds: 3));

          /*final gesture = await tester.startGesture(const Offset(0, 300)); //Position of the scrollview
          await gesture.moveBy(const Offset(0, -300)); //How much to scroll by*/
          await tester.pump();

          // Verify the counter increments by 1.
          expect(find.byType(CircularLoading), findsOneWidget);
        });


  });


}
