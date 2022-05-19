import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/loginpage/login/login_form.dart';
import 'package:hotel_booking/page1/page1info/pahe1form.dart';
import 'package:hotel_booking/page3/alert.dart';
import 'package:hotel_booking/page3/page3form.dart';

import '../../page2/page2screen.dart';
import '../../widgets/curved_widget.dart';
import '../page1/page1info/welcomeinfo.dart';
import '../services/authservice.dart';
import '../page2/page2screen.dart';

import '../page1/page1info/pahe1form.dart';

var Country = getUsercountry();

class Page3Screen extends StatefulWidget {
  @override
  State<Page3Screen> createState() => _Page3ScreenState();
}

class _Page3ScreenState extends State<Page3Screen> {
  var name = getUsername();
  var password = getUserpassword();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xff6a515e)),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfff2cbd0), Color(0xfff4ced9)],
          )),
          child: SingleChildScrollView(
            child: Stack(children: [
              CurvedWidget(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 50),
                  width: double.infinity,
                  height: 300,
                  // color: Colors.red,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white24],
                    ),
                  ),

                  child: const Text(
                    'Complete Setting',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff6a515e),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 230),
                child: page3form(),
              )
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [Color(0xffffae88), Color(0xff8f93ea)],
          // ),

          onPressed: () {
            AuthService().updateUser(Country).then((val) {
              //_navigateToNextScreen(context);

              print("username is :" + Country);
              Fluttertoast.showToast(
                  msg: val.data['msg'],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
            if (getChildNum() == '') {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                          alignment: Alignment.topCenter,
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text("Warning!!",
                                          style: TextStyle(
                                              fontFamily: "Segoe UI",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 23,
                                              color: Color.fromARGB(
                                                  255, 233, 35, 35))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                          "Please make sure you enter all the information before proceeeding to the next page.",
                                          style: TextStyle(
                                              fontFamily: "Segoe UI",
                                              fontSize: 16,
                                              color: Color(0xff070707))),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 70,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffffae88),
                                              Color(0xff8f93ea)
                                            ],
                                          ),
                                        ),
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: StadiumBorder(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: const <Widget>[
                                                  Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: -50,
                                child: CircleAvatar(
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(70)),
                                      child:
                                          Image.asset("assets/images/log.jpg")),
                                  radius: 45,
                                ))
                          ]),
                    );
                  });
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => alertPa(),
                  ));
            }
          },
          label: Text(
            'Finish',
            style: TextStyle(fontSize: 16),
          ),

          backgroundColor: Color(0xff6a515e),
          elevation: 10,
        ));
  }
}
