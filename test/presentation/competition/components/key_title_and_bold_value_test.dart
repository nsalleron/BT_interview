import 'package:flutball/presentation/competition/components/text_with_bold_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testWidgets(
    '''GIVEN text and value WHEN $TextWithBoldValue is displayed THEN we have one ''',
    (WidgetTester tester) async {
      // GIVEN
      const TextWithBoldValue keyTitleAndBoldValueText =
          TextWithBoldValue(title: 'title', value: 'value');

      // WHEN
      await tester.pumpWidgetBuilder(keyTitleAndBoldValueText);

      // THEN
      expect(find.byType(RichText).first, findsOneWidget);
    },
  );
}
