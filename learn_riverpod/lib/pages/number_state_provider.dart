import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Basic number state provider.
final numberStateProvider = StateProvider<int>((ref) {
  return 20;
});

class NumberStateProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final number = watch(numberStateProvider).state;
    return Scaffold(
      appBar: AppBar(
        title: Text("Number State Provider"),
      ),
      body: Center(
        child: Text(
          number.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => increment(context),
      ),
    );
  }

  /// Used to increment the value of the number and to see changes.
  void increment(BuildContext context) {
    context.read(numberStateProvider).state++;
  }
}
