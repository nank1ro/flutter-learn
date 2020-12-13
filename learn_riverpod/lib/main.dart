import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// Basic provider example.
final numberProvider = Provider<int>((ref) {
  return 10;
});

// Basic number state provider.
final numberStateProvider = StateProvider<int>((ref) {
  return 20;
});

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final number = watch(numberProvider);
    final numberState = watch(numberStateProvider).state;

    return Scaffold(
      body: Center(
        child: Text('$numberState'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increment(context),
        child: Icon(
          Icons.plus_one,
        ),
      ),
    );
  }

  /// Used to increment the value of the number and to see changes.
  void increment(BuildContext context) {
    context.read(numberStateProvider).state++;
  }
}
