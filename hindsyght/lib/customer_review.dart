import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hindsyght/Exapantion.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<String> title = ["Rating", "Date", "Location", "Sort By"];
List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: title[index],
      expandedValue: 'This is item number $index',
    );
  });
}

class CustomerReview extends StatefulWidget {
  @override
  _CustomerReviewState createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview> {
  bool selected = false;
  double size;
  List<String> name = ["By John", "By Kiya", "By John", "By Kiya"];
  List<Item> _data = generateItems(title.length);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Review',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.blue,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.menu,
            color: Colors.blue,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 10, bottom: selected ? 20 : 0),
                    child: InkWell(
                      onTap: () {
                        setState(() => selected = !selected);
                      },
                      child: Row(
                        children: [
                          Text(
                            "Review",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 35,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "${name.length} Review",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              selected ? _buildPanel() : Container(),
              Column(
                children: name
                    .asMap()
                    .map((i, element) => MapEntry(
                          i,
                          Column(
                            children: [
                              Divider(
                                indent:
                                    MediaQuery.of(context).size.width * 0.05,
                                endIndent:
                                    MediaQuery.of(context).size.width * 0.05,
                                thickness: 0.3,
                                color: Colors.black38,
                              ),
                              listTileInfo(name[i]),
                              i + 1 == name.length
                                  ? Divider(
                                      indent:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      endIndent:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      thickness: 0.3,
                                      color: Colors.black38,
                                    )
                                  : Container(),
                            ],
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: _data
            .asMap()
            .map(
              (i, item) => MapEntry(
                i,
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            setState(() => item.isExpanded = !item.isExpanded),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(item.headerValue),
                              ),
                              item.isExpanded
                                  ? Icon(Icons.arrow_drop_up,
                                      color: Colors.blue)
                                  : Icon(Icons.arrow_drop_down,
                                      color: Colors.blue),
                            ],
                          ),
                        ),
                      ),
                      ExpandedSection(
                        child: Container(
                          height: 200,
                          color: Colors.white,
                        ),
                        expand: item.isExpanded,
                      ),
                      i + 1 == _data.length
                          ? Container()
                          : Container(
                              height: 0.4,
                              color: Colors.grey,
                            ),
                    ],
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }

  Widget listTileInfo(String name) {
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
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        "Larem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typsetting industry. ",
                        style: TextStyle(fontSize: 12, height: 1.5),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
