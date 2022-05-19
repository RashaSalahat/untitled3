import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../header_logo.dart';
import '../my_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  Column(
                    children: [
                      // Text('Location'),
                      Row(
                        children: [
                          // Icon(
                          //   Icons.location_on,
                          //   color: drawerColor,
                          // ),
                          // Text('Ukraine'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              // margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20)
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.search),
                  // Text('Search pet to adopt'),
                  // Icon(Icons.settings)
                ],
              ),
            ),

            Container(
              height: 50,
              child: Text(
                "Doctor",
                style: GoogleFonts.pacifico(
                    fontWeight: FontWeight.w200,
                    fontSize: 30,
                    color: Color(0xff6a515e)),
              ),
            ),
            // SizedBox(
            //   height: 550,
            // )
            Column(
              children: <Widget>[
                MyHeader(
                  height: 535,
                  imageUrl: 'assets/images/doctor.png',
                  child: HeaderLogo(),
                ),
              ],
            ),
            Container(height: 100, child: Text("")),
          ],
        ),
      ),
    );
  }
}
