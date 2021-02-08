import 'package:flutter/material.dart';
import 'package:hindsyght/Exapantion.dart';

// stores ExpansionPanel state information
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

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  List<Item> _data = generateItems(title.length);

  @override
  Widget build(BuildContext context) {
    return _buildPanel();
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
                          color: Colors.red,
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
}
