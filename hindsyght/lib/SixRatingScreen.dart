import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SixRatingScren extends StatefulWidget {
  @override
  _SixRatingScrenState createState() => _SixRatingScrenState();
}

class _SixRatingScrenState extends State<SixRatingScren> {
  bool showvalue = false;
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
                            "Feedback",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
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
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Additional Feedback(optional)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(fontSize: 16),
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Give your review here...",
                      border: InputBorder.none,
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(bottom: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Words limit 1000.",
                  style: TextStyle(color: Colors.blue, fontSize: 10),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    value: this.showvalue,
                    onChanged: (bool value) {
                      setState(() {
                        this.showvalue = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text:
                              'I certify that this review is my genuine opinion based on my own exprience\nwith the company. I submit the review in accordance with Hindsyght\'s\n',
                          style: TextStyle(
                              color: Colors.black, fontSize: 10, height: 1.5),
                          children: [
                            TextSpan(
                              text: 'Terms of Use. ',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10),
                              recognizer: TapGestureRecognizer(),
                            ),
                            TextSpan(
                              text:
                                  'I am not an empoyee of this company or one of its direct\ncompetitors. I also confirm tht, if i was offerd an incerntive in exchange\nfor providing the review, the offer did not influence the content of this review.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 210,
            height: 50,
            child: RaisedButton(
              elevation: 5,
              onPressed: () {},
              color: Colors.blue[500],
              child: Text("Post Review",
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
          Text(
            "Read our review guidelines",
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    ));
  }
}
