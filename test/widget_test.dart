// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:studytrackapp/main.dart';

void main() {
  testWidgets('splash opens the study tracker', (WidgetTester tester) async {
    await tester.pumpWidget(const StudyTrackApp());

    expect(find.text('Small steps.\nBig chapters.'), findsOneWidget);
    expect(find.byKey(const Key('start-studying')), findsOneWidget);

    await tester.tap(find.byKey(const Key('start-studying')));
    await tester.pumpAndSettle();

    expect(find.text('Today, at your pace.'), findsOneWidget);
    expect(find.text('Review lecture notes'), findsOneWidget);
    expect(find.text('0 of 3 tasks complete'), findsOneWidget);

    await tester.tap(find.byType(Checkbox).first);
    await tester.pumpAndSettle();

    expect(find.text('1 of 3 tasks complete'), findsOneWidget);
    expect(find.text('33%'), findsOneWidget);
  });
}
