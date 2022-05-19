import 'package:hotel_booking/page/simple_appbar_page.dart';
import 'package:hotel_booking/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/settingpage/setpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'MainPageGrad/MainPageGrad.dart';
import 'chatt/page1chat.dart';

class BottomParFood extends StatefulWidget {
  const BottomParFood({Key? key}) : super(key: key);
  // final String title;
  @override
  State<BottomParFood> createState() => _BottomParFoodState();
}

class _BottomParFoodState extends State<BottomParFood> {
  // bg color
  Color bgColor = const Color(0XFF214283); //Colors.black;

  int _page = 4; //current page index

  //pages text
  final pages = [
    MyMainPageGrad(),
    SimpleAppBarPage(),
    ChattingPage(),
    ProfilePage(),
    // ProfilePage(),
    // NotificationsPage3(),
    // //NotificationsPage2(),
    // NotificationsPage3(),
    // NotificationsPage4(),
    SetScreen(),
    // NotificationsPage4(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressedShowExitDialog(context),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(""),
        //  backgroundColor: Colors.white,
        // ),
        backgroundColor: Colors.white,
        body: pages[_page],

        bottomNavigationBar: CurvedNavigationBar(
          index: 4,
          height: 60.0,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.design_services,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.message,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: Color(0xfff2cbd0),
          buttonBackgroundColor: Color(0xfff2cbd0),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  //define a toast method
  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    ));
  }

//close app confirm dialog
  Future<bool> _onBackButtonPressedShowExitDialog(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          //create and return a dialog
          return AlertDialog(
            title: const Text("Really??"),
            content: const Text("Do you want to close the app ?"),
            actions: <Widget>[
              //a no btn
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No, Stay"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes, Close"),
              ),
            ],
          );
        });
    return exitApp ?? false;
  }
}
