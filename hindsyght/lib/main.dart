import 'package:flutter/material.dart';
import 'package:hindsyght/Modal/items.dart';
import 'package:hindsyght/provider/list_provider.dart';
import 'package:hindsyght/sponsored_Results.dart';
import 'package:hindsyght/FiveRatingScreen.dart';
import 'package:hindsyght/FourthRatingScreen.dart';
import 'package:hindsyght/SecondRatingscreen.dart';
import 'package:hindsyght/SixRatingScreen.dart';
import 'package:hindsyght/ThirdRatingScreen.dart';
import 'package:provider/provider.dart';
import './FirstRatingScreen.dart';
import './config.dart';
import 'customer_review.dart';
import 'DropDownList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ListDetail())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CompanyList(),
        // home: PageView(children: [
        //   FirstRatingScreen(),
        //   SecondRatingScreen(),
        //   ThirdRatingScreen(),
        //   FourthRatingScreen(),
        //   FiveRatingScreen(),
        //   SixRatingScren()
        // ]),
      ),
    );
  }
}
