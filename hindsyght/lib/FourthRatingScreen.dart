import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'Sentences.dart';

class FourthRatingScreen extends StatefulWidget {
  @override
  _FourthRatingScreenState createState() => _FourthRatingScreenState();
}

class _FourthRatingScreenState extends State<FourthRatingScreen> {
  List<Sentence> _sentences = <Sentence>[
    Sentence(
        1,
        'The vendor was poor and was not able to meet your expectations valuable recommendations',
        false),
    Sentence(
        2,
        'The vendor was avarage and needed significant help to get the work done.',
        false),
    Sentence(
        3,
        'The vendor was good, but some assistance from your team was needed to meet your expectations.',
        false),
    Sentence(
        4,
        'The vendor was in control , and met most of your expectations.',
        false),
    Sentence(
        5,
        'The vendor took change, had total control of either the project work or thier day activity, and was able to meet your expecatations for quality, timeline, cost.',
        true),
  ];
  double ratingValue = 3;
  String _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(
              1.0,
              1.0,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  "Review Acrify Technology",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Please provide a description of your experience below. Your\nreview will help others in their business decisiom. Remember to\n provide as much detail as possible, and keep it real.",
                    style: TextStyle(height: 1.5, fontSize: 11.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset("assets/images/apple.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Execution",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: ratingValue,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            unratedColor: Colors.grey[300],
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                ratingValue = rating;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text("Knowledge(${ratingValue.toInt()}",
                                    style: TextStyle(color: Colors.blue)),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.amber,
                                ),
                                Text(")", style: TextStyle(color: Colors.blue))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: List.generate(
                  _sentences.length,
                  (index) => InkWell(
                      splashColor: Colors.blueAccent,
                      onTap: () {
                        setState(() {
                          _sentences.forEach((element) {
                            element.selected = false;
                          });
                          _sentences[index].selected = true;
                          _selectedValue = _sentences[index].sentance;
                          print(_selectedValue);
                        });
                      },
                      child: Container(
                        width: 360,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: _sentences[index].selected
                                ? Colors.blue[50]
                                : Colors.white,
                            border: _sentences[index].selected
                                ? Border.all(color: Colors.blue)
                                : Border.all(color: Colors.black12)),
                        child: Text(
                          _sentences[index].sentance,
                          style: TextStyle(fontSize: 12, height: 1.5),
                        ),
                      )),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 210,
            height: 50,
            child: RaisedButton(
              elevation: 5,
              onPressed: () {},
              color: Colors.blue[500],
              child: Text("Next",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
