import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumbersNotifier extends StateNotifier<List<int>> {
  // Empty the default list in the constructor.
  NumbersNotifier() : super([]);

  /// Add an integer number to the current list.
  void add(int number) => state = [...state, number];
}

// Basic state notifier provider.
final numbersNotifierProvider = StateNotifierProvider<NumbersNotifier>((ref) {
  return NumbersNotifier();
});

class NumbersStateNotifierProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers State Notifier Provider"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            final number = watch(numbersNotifierProvider.state);
            return ListView.builder(
              itemCount: number.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(number[index].toString());
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          /// Used to increment the value of the number and to see changes.
          context.read(numbersNotifierProvider).add(Random().nextInt(100));
        },
      ),
    );
  }
}
