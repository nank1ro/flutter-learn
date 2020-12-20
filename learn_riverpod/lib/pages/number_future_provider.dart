import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Basic provider example.
final numberFutureProvider = FutureProvider.autoDispose<int>((ref) {
  return Future.value(50);
});

class NumberFutureProvider extends StatelessWidget {
  const NumberFutureProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Future Provider"),
      ),
      body: Center(
        child: Consumer(builder: (context, watch, child) {
          final number = watch(numberFutureProvider);
          return number.when(
              data: (data) => Text(data.toString()),
              loading: () => CircularProgressIndicator(),
              error: (_, stackTrace) => Text(stackTrace.toString()));
        }),
      ),
    );
  }
}
