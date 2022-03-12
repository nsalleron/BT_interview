import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testWidgets(
    '''GIVEN text and value WHEN $KeyTitleAndBoldValueText is displayed THEN we have one ''',
    (WidgetTester tester) async {
      // GIVEN
      const KeyTitleAndBoldValueText keyTitleAndBoldValueText =
          KeyTitleAndBoldValueText(title: 'title', value: 'value');

      // WHEN
      await tester.pumpWidgetBuilder(keyTitleAndBoldValueText);

      // THEN
      expect(find.byType(RichText).first, findsOneWidget);
    },
  );
}
