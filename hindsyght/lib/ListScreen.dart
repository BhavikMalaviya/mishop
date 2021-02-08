import 'dart:ffi';

import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hindsyght/config.dart';

import 'CompanyInfo.dart';

class ListScreen extends StatefulWidget {
  final double size;
  ListScreen({this.size});
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Viewing 1-20 of 862 Companies",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                Text(
                  "Page 1 of 38",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )
              ],
            ),
          ),
          Container(
            // height: double.infinity,

            height: SizeConfig.blockSizeVertical * 50,
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return listTileInfo();
                },
                itemCount: 100,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1)
            ]),
            // height: SizeConfig.blockSizeVertical * 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildSizedBox("Previous 40"),
                buildSizedBox("Next 20"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox(String name) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.2,
      height: SizeConfig.blockSizeVertical * 8,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {},
        color: Colors.blue[500],
        child: Text(name,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeVertical * 2.5,
              color: Colors.white,
            )),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 30)),
      ),
    );
  }

  Widget listTileInfo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Image.asset(
            "assets/images/google.png",
            height: 150,
            width: 150,
          )),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Acrify",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "IT Services",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    unratedColor: Colors.grey[300],
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Icon(
                      Icons.pin_drop,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        "Laguna kjn lkklmn ",
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
