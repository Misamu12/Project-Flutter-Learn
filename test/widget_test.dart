import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_learn/main.dart';

void main() {
  testWidgets('Le compteur augmente et se réinitialise',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterLearnApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Réinitialiser'));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
