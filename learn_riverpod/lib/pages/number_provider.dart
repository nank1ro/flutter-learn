import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Basic provider example.
final numberProvider = Provider<int>((ref) {
  return 11;
});

class NumberProvider extends StatelessWidget {
  const NumberProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Provider"),
      ),
      body: Center(
        child: Text(
          context.read(numberProvider).toString(),
        ),
      ),
    );
  }
}
