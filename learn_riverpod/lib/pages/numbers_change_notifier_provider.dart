import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumbersChangeNotifier extends ChangeNotifier {
  // Initial array of numbers.
  final List<int> _numbers = [];

  // Public getter in order to avoid manipulating the list directly.
  UnmodifiableListView get numbers => UnmodifiableListView(_numbers);

  /// Add an integer number to the current list.
  void add(int number) {
    _numbers.add(number);
    notifyListeners();
  }
}

// Basic state notifier provider.
final numbersChangeNotifierProvider =
    ChangeNotifierProvider<NumbersChangeNotifier>((ref) {
  return NumbersChangeNotifier();
});

class NumbersChangeNotifierProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers Change Notifier Provider"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            final number = watch(numbersChangeNotifierProvider).numbers;
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
          context
              .read(numbersChangeNotifierProvider)
              .add(Random().nextInt(100));
        },
      ),
    );
  }
}
