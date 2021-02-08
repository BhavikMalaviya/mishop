import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_test/helper.dart';
import 'package:http/http.dart';

import 'fakeClient.dart';

class Demo extends ConsumerWidget {
  final int value = 0;
  final provider = ChangeNotifierProvider((_) => Helper());

  final fakeHttpProvider = Provider((ref) => FakeHttpClient());
  final responseProvider = FutureProvider<String>((ref) async {
    // final httpClient = ref.read(fakeHttpProvider);
    // return httpClient.get('http://response.com');
  });
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => {context.read(provider).increament()},
              child: Text("Increament"),
            ),
            RaisedButton(
              onPressed: () => {context.read(provider).decreament()},
              child: Text("Decreament"),
            ),
            Consumer(builder: (context, watch, child) {
              final increamentNotifier = watch(provider);
              return Text(increamentNotifier.value.toString());
            })
          ],
        ),
      ),
    );
  }
}
