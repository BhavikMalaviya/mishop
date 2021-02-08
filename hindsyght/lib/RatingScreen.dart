import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  bool _isSwitched = false;
  String _selected = "A";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Anonymous Review?"),
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  child: Text("First Item"),
                  value: 'A',
                ),
                DropdownMenuItem(
                  child: Text("Second Item"),
                  value: 'B',
                ),
                DropdownMenuItem(
                  child: Text("Third Item"),
                  value: 'C',
                )
              ],
              onChanged: (String index) {
                setState(() {
                  _selected = index;
                });
              },
              value: _selected,
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [],
            )
          ]),
        ),
      ),
    );
  }
}
