import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/doctor/Doctor/drawerScreendoctor.dart';
import 'package:hotel_booking/doctor/Doctor/homeScreendoctor.dart';

class DoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), HomeScreen()],
      ),
    );
  }
}
