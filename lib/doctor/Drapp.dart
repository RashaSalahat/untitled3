import 'package:flutter/material.dart';
import 'package:hotel_booking/loginpage/login/welcome.dart';

class DRApp extends StatelessWidget {
  const DRApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // setUsername("rand");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xff6a515e),
          labelStyle: TextStyle(color: Color(0xff6a515e)), // color for text
          indicator: UnderlineTabIndicator(), //color for indicator (underline)
          //borderSide: BorderSide(color: Color(0xff6a515e))
        ),
        primaryColor: Color(0xff6a515e),
        cursorColor: Color(0xff6a515e),
      ),
      home: welcomescreen(),
    );
  }
}
