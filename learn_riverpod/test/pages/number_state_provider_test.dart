import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_riverpod/main.dart';
import 'package:learn_riverpod/pages/number_state_provider.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
  });
  testWidgets('''
  Given user in home page
  When [numberStateProvider] is pressed
  Then the value 20 is displayed
  When the floating action button is pressed
  Then the value 21 is displayed
  When the floating action button is pressed
  Then the value 22 is displayed
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
    final button = find.byKey(ValueKey("numberStateProvider"));
    // ACT
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(NumberStateProvider), findsOneWidget);
    // ASSERT
    expect(find.text('20'), findsOneWidget);

    final increaseButton = find.byType(FloatingActionButton);
    // Tap the floating action button.
    await tester.tap(increaseButton);
    // Await for the UI to rebuild.
    await tester.pump();

    expect(find.text('21'), findsOneWidget);

    // repeat to check if the number becomes 22
    await tester.tap(increaseButton);
    // Await for the UI to rebuild.
    await tester.pump();

    expect(find.text('22'), findsOneWidget);
  });
}
