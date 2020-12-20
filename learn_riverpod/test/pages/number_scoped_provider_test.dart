import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_riverpod/main.dart';
import 'package:learn_riverpod/pages/number_scoped_provider.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
  });
  testWidgets('''
  Given user in home page
  When [scopedProvider] is pressed
  Then the value 10 is displayed
  ''', (tester) async {
    // ASSEMBLE
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MyHomePage(),
          navigatorObservers: [mockObserver],
        ),
      ),
    );
    verify(mockObserver.didPush(any, any));
    expect(find.byType(MyHomePage), findsOneWidget);
    final button = find.byKey(ValueKey("scopedProvider"));
    // ACT
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(NumberScopedProvider), findsOneWidget);
    // ASSERT
    final text = find.text('10');
    expect(text, findsOneWidget);
  });
}
