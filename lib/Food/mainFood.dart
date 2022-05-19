import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/Food/DetailsScreen.dart';
import 'package:hotel_booking/Food/HomeScreen.dart';
import 'package:hotel_booking/Food/constant.dart';

class MyFood extends StatelessWidget {
  const MyFood({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
