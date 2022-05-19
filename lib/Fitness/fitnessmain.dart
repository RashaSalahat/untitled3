// @dart=2.9

import 'package:hotel_booking/Fitness/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/router.dart' as router;

class FitnessApp extends StatelessWidget {
  const FitnessApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
