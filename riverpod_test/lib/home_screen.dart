import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import 'items.dart';

final notesprovider = ChangeNotifierProvider<Items>((_) {
  return Items();
});

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final note = TextEditingController();
    final noteswatcher = watch(notesprovider);

    final _rindex = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverpodDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: note,
              decoration: InputDecoration(
                  labelText: "Name", labelStyle: TextStyle(fontSize: 16)),
            ),
            RaisedButton(
              onPressed: () =>
                  {context.read(notesprovider).onSubmit(note.text)},
              color: Colors.blue,
              child: Text(
                "Add",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            TextField(
              controller: _rindex,
              decoration: InputDecoration(
                  labelText: "Index", labelStyle: TextStyle(fontSize: 16)),
            ),
            RaisedButton(
              onPressed: () {
                print(_rindex.text);
                context.read(notesprovider).remove(
                    noteswatcher.note.removeAt(int.parse(_rindex.text)));
              },
              color: Colors.blue,
              child: Text(
                "Remove",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  print(noteswatcher.note[index]);
                  return Text(noteswatcher.note[index]);
                },
                itemCount: noteswatcher.note.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
