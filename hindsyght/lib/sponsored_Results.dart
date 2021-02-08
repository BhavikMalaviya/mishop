import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hindsyght/Modal/items.dart';
import 'package:hindsyght/config.dart';
import 'package:hindsyght/provider/list_provider.dart';
import 'package:provider/provider.dart';

import 'Tabs.dart';

class CompanyList extends StatefulWidget {
  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  List<Tabs> _tabs = <Tabs>[Tabs(1, 'List', true), Tabs(2, 'Map', false)];
  String title = "List";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Items item = Provider.of<ListDetail>(context).getItems();
    print(item.company_name);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sponsored Results',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: Container(
        // height: size.height,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        border: Border.all(color: Colors.blue)),
                    child: Center(
                      child: GestureDetector(
                        child: Icon(
                          Icons.filter_list,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      _tabs.length,
                      (index) => InkWell(
                        splashColor: Colors.blueAccent,
                        onTap: () {
                          setState(() {
                            _tabs.forEach((element) {
                              element.selected = false;
                            });
                            _tabs[index].selected = true;
                            title = _tabs[index].title;
                          });
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.10,
                          decoration: BoxDecoration(
                              color: _tabs[index].selected
                                  ? Colors.blue[50]
                                  : Colors.white,
                              border: Border.all(color: Colors.blue)),
                          child: Center(
                            child: GestureDetector(
                              child: Text(
                                _tabs[index].title,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // title == "List" ? listScreen() : Container()
            title == "List"
                ? Container(
                    padding: EdgeInsets.all(12),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Viewing 1-20 of 862 Companies",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        Text(
                          "Page 1 of 38",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                  )
                : Container(),
            title == "List"
                ? Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        indent: MediaQuery.of(context).size.width * 0.05,
                        endIndent: MediaQuery.of(context).size.width * 0.05,
                        thickness: 0.3,
                        color: Colors.black,
                      ),
                      itemBuilder: (context, index) {
                        return listTileInfo(item);
                      },
                      itemCount: 100,
                    ),
                  )
                : Expanded(
                    child: mapScreen(),
                  ),
            title == "List"
                ? Container(
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
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildSizedBox("Previous 40"),
                        buildSizedBox("Next 20"),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(String name) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {},
        color: Colors.blue[500],
        child: Text(name,
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 2.5,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 30)),
      ),
    );
  }

  Widget listScreen(Items items) {
    return Expanded(
      child: Column(
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
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => Divider(
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
              thickness: 0.3,
              color: Colors.black,
            ),
            itemBuilder: (context, index) {
              return listTileInfo(items);
            },
            itemCount: 100,
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
                BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1)
              ],
            ),
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

  Widget listTileInfo(Items items) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Image.asset(
            "assets/images/google.png",
            height: 100,
            width: 100,
          )),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Acrify",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "IT Services",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
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
                    height: 5,
                  ),
                  Row(children: [
                    Icon(
                      Icons.pin_drop,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        "Laguna Beach CA ",
                        style: TextStyle(fontSize: 14),
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
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }

  Widget mapScreen() {
    return Container(
      child: Column(
        children: [
          Expanded(child: Container(child: Center(child: Text("Map Screen")))),
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: () {},
                  color: Colors.blue[500],
                  child: Text("View More Results",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 30)),
                ),
              ))
        ],
      ),
    );
  }
}
