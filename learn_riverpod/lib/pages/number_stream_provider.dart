import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Basic provider example.
final numberStreamProvider =
    StreamProvider.autoDispose.family<int, int>((ref, extraNumber) {
  return Stream.value(60 + extraNumber);
});

class NumberStreamProvider extends StatelessWidget {
  const NumberStreamProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Stream Provider"),
      ),
      body: Center(
        child: Consumer(builder: (context, watch, child) {
          final number = watch(numberStreamProvider(40));
          return number.when(
              data: (data) => Text(data.toString()),
              loading: () => CircularProgressIndicator(),
              error: (_, stackTrace) => Text(stackTrace.toString()));
        }),
      ),
    );
  }
}
