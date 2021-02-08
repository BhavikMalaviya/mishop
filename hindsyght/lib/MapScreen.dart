import 'package:flutter/material.dart';
import 'package:hindsyght/config.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(child: Text("Map Screen")),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                ],
              ),
              child: Text("Sample")),
        ],
      ),
    );
  }
}
