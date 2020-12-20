import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_riverpod/main.dart';
import 'package:learn_riverpod/pages/number_future_provider.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
  });
  testWidgets('''
  Given user in home page
  When [futureProvider] is pressed
  Then the value 50 is displayed
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
    final button = find.byKey(ValueKey("futureProvider"));
    // ACT
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(NumberFutureProvider), findsOneWidget);
    // ASSERT
    final text = find.text('50');
    expect(text, findsOneWidget);
  });
}
