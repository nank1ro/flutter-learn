import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_riverpod/main.dart';
import 'package:learn_riverpod/pages/numbers_change_notifier_provider.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
  });
  testWidgets('''
  Given user in home page
  When [numbersChangeNotifierProvider] is pressed
  Then the value [NumbersChangeNotifierProvider] page is displayed and the list length is equal to 0
  When the floating action button is pressed
  Then the list lenght increases by 1
  When the floating action button is pressed
  Then the list lenght increases by 1 again and becomes 2
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
    final button = find.byKey(ValueKey("numbersChangeNotifierProvider"));
    // ACT
    await tester.tap(button);
    await tester.pumpAndSettle();
    // ASSERT
    expect(find.byType(NumbersChangeNotifierProvider), findsOneWidget);

    final floatingButton = find.byType(FloatingActionButton);

    // At the beginning the list view length equals 0
    expect(find.text('2'), findsNothing);

    await tester.tap(floatingButton);
    await tester.pump();

    // After a button press the list view length equals 0
    expect(find.text('2'), findsOneWidget);

    await tester.tap(floatingButton);
    await tester.pump();

    // After a second button press the list view length equals 2
    expect(find.text('2'), findsNWidgets(2));
  });
}
