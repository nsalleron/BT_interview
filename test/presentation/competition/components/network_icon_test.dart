import 'package:flutball/presentation/competition/components/club_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testWidgets(
    '''GIVEN null url WHEN $CompetitionIcon is displayed THEN not found icon should be displayed''',
    (WidgetTester tester) async {
      // GIVEN
      const CompetitionIcon clubIcon = CompetitionIcon(url: null);

      // WHEN
      await tester.pumpWidgetBuilder(clubIcon);
      // THEN
      expect(find.byIcon(Icons.report_problem), findsOneWidget);
    },
  );
}
