import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Basic provider example.
final numberScopedProvider = ScopedProvider<int>((ref) {
  throw UnimplementedError();
});

class NumberScopedProvider extends StatelessWidget {
  const NumberScopedProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Scoped Provider"),
      ),
      body: Center(
        child: ProviderScope(
          overrides: [
            numberScopedProvider.overrideWithValue(10),
          ],
          child: DetailsPage(),
        ),
      ),
    );
  }
}

class DetailsPage extends ConsumerWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final number = watch(numberScopedProvider);
    return Text(number.toString());
  }
}
