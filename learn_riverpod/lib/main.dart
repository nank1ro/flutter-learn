import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/pages/number_future_provider.dart';
import 'package:learn_riverpod/pages/number_provider.dart';
import 'package:learn_riverpod/pages/number_scoped_provider.dart';
import 'package:learn_riverpod/pages/number_state_provider.dart';
import 'package:learn_riverpod/pages/numbers_change_notifier_provider.dart';
import 'package:learn_riverpod/pages/numbers_state_notifier_provider.dart';
import 'package:learn_riverpod/pages/number_stream_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final Map<String, Widget> pages = {
  "numberProvider": NumberProvider(),
  "numberStateProvider": NumberStateProvider(),
  "numbersStateNotifierProvider": NumbersStateNotifierProvider(),
  "numbersChangeNotifierProvider": NumbersChangeNotifierProvider(),
  "futureProvider": NumberFutureProvider(),
  "streamProvider": NumberStreamProvider(),
  "scopedProvider": NumberScopedProvider(),
};

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: pages.entries
            .map(
              (entry) => RaisedButton(
                child: Text(entry.key),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => entry.value),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
