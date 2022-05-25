//import 'package:aftersignup/color_filters.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/page/simple_appbar_page.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/screens/clinic.dart';
import 'package:hotel_booking/screens/clothesHome.dart';
import 'package:hotel_booking/color_filters.dart';
import 'package:hotel_booking/screens/pharm.dart';
import 'package:hotel_booking/pages/root_app_fitness.dart';
import 'package:hotel_booking/themechat.dart';
import 'package:hotel_booking/bottomApp.dart';
import 'homeToyScreen.dart';
import 'loginpage/login/welcome.dart';
//import 'package:aftersignup/color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String title = '';

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme().light,
        darkTheme: AppTheme().light,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: title,
        //     debugShowCheckedModeBanner: false,
        // onGenerateRoute: router.generateRoute,
        // theme: ThemeData(primarySwatch: Colors.grey),
        // home: SimpleAppBarPage(),
        home: welcomescreen(),
      );
}
